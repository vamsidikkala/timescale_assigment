#include <postgres.h>
#include <fmgr.h>
#include <utils/errcodes.h>
#include <utils/builtins.h>
#include <utils/tuplesort.h>
#include <nodes/execnodes.h>
#include <parser/parse_oper.h>
#include <utils/guc.h>
#include <utils/numeric.h>
#include "catalog/pg_type_d.h"

#if PG_VERSION_NUM < 120000 || PG_VERSION_NUM >= 130000
#error "Unsupported PostgreSQL version. Use version 12."
#endif

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

PG_FUNCTION_INFO_V1(median_transfn);

typedef struct
{
  Oid datum_type;
  Oid sort_collation_id;
  Oid sort_operator;
  int32 work_mem;
  int64 total_elements;
  Tuplesortstate *sortstate;
  AggState *agg_state;
}MedianState;

MedianState *median_init(MemoryContext memoryCtx, Oid datum_type, 
                         Oid collation);
Datum median_find_mean(MedianState *median_state, Datum val1, Datum val2);
static inline bool median_is_supported_datatype(Oid dtype);
Datum median_calculate_median(MedianState *edian_state);

MedianState *median_init(MemoryContext agg_context, Oid datum_type, 
                         Oid sort_collation_id)
{
    MedianState *median_state = NULL;
    Oid          sort_op;
    bool         is_hashable;
    MemoryContext prev_context;   
    const char  *work_mem_str;

    prev_context = MemoryContextSwitchTo(agg_context);
    median_state = MemoryContextAllocZero(agg_context, sizeof(MedianState));
    median_state->datum_type = datum_type;
    median_state->sort_collation_id = sort_collation_id; 
 
    get_sort_group_operators(datum_type, true, false, false, &sort_op, NULL,
                             NULL, &is_hashable);

    median_state->sort_operator = sort_op; 
    work_mem_str = GetConfigOption("work_mem", false, false);
    
    median_state->work_mem = pg_atoi(work_mem_str, sizeof(int32), 0);
    median_state->sortstate = tuplesort_begin_datum(datum_type, 
                                               median_state->sort_operator, 
                                               median_state->sort_collation_id, 
                                               false, median_state->work_mem,
                                               NULL, true); 
    median_state->total_elements = 0;
    
    MemoryContextSwitchTo(prev_context);
    return median_state;
}
/*
 * Median state transfer function.
 *
 * This function is called for every value in the set that we are calculating
 * the median for. On first call, the aggregate state, if any, needs to be
 * initialized.
 */
Datum
median_transfn(PG_FUNCTION_ARGS)
{
    MemoryContext agg_context;
    MedianState *median_state = 
                (MedianState *)(PG_ARGISNULL(0) ? NULL : PG_GETARG_POINTER(0));

    if (!AggCheckCallContext(fcinfo, &agg_context))
        elog(ERROR, "median_transfn called in non-aggregate context");

    if (median_state == NULL)
    {
	    median_state = median_init(agg_context, 
                                   get_fn_expr_argtype(fcinfo->flinfo, 1),
                                   fcinfo->fncollation); 
        median_state->agg_state = (AggState *)fcinfo->context;
 	    //median_state = (MedianState *) palloc(sizeof(MedianState));
    }

    if (!median_is_supported_datatype(median_state->datum_type))
      elog(ERROR, "median feature is not supported with data type: %s", 
                   format_type_be(median_state->datum_type));

    if (PG_ARGISNULL(1))
        goto finally;
 
    tuplesort_putdatum(median_state->sortstate, PG_GETARG_DATUM(1), 
                       PG_ARGISNULL(1)); 

    median_state->total_elements++;

finally:
   PG_RETURN_POINTER(median_state);
}

PG_FUNCTION_INFO_V1(median_finalfn);

/*
 * Median final function.
 *
 * This function is called after all values in the median set has been
 * processed by the state transfer function. It should perform any necessary
 * post processing and clean up any temporary state.
 */
Datum
median_finalfn(PG_FUNCTION_ARGS)
{
    MemoryContext agg_context;
    MedianState   *median_state = NULL;
    Datum          median;

    if (!AggCheckCallContext(fcinfo, &agg_context))
        elog(ERROR, "median_finalfn called in non-aggregate context");

    median_state = 
                (MedianState *) (PG_ARGISNULL(0) ? NULL: PG_GETARG_POINTER(0));

    if (median_state == NULL)
      PG_RETURN_NULL();

    if (!median_is_supported_datatype(median_state->datum_type))                
      elog(ERROR, "median feature is not supported with data type: %s",                      
                   format_type_be(median_state->datum_type)); 

    if (median_state->total_elements == 0)
      goto finally;

    tuplesort_performsort(median_state->sortstate);

    median = median_calculate_median(median_state);

finally:

    tuplesort_end(median_state->sortstate); 

    if (median_state->total_elements)
        PG_RETURN_DATUM(median);
    PG_RETURN_NULL();
}

Datum median_calculate_median(MedianState *median_state)
{ 
    int64 middle_element_idx = median_state->total_elements / 2;
    Datum median;
    bool isNull;

    if (median_state->total_elements % 2 == 1)
    {

      if (!tuplesort_skiptuples(median_state->sortstate, 
                                middle_element_idx, true))
        elog(ERROR, "missing row in median_finalfn");

      /* Null is not expected, so we don't check for nulls */
      if (!tuplesort_getdatum(median_state->sortstate, true, &median, &isNull,
                             NULL))
        elog(ERROR, "missing row in median_finalfn");
      
    }
    else
    {
      Datum val1, val2;

      if (!tuplesort_skiptuples(median_state->sortstate, 
                                middle_element_idx - 1, true))
        elog(ERROR, "missing row in median_finalfn");

      /* Null is not expected, so we don't check for nulls */
      if (!tuplesort_getdatum(median_state->sortstate, true, &val1, &isNull,
                              NULL))
        elog(ERROR, "missing row in median_finalfn");

      if (!tuplesort_getdatum(median_state->sortstate, true, &val2, &isNull,
                              NULL))
        elog(ERROR, "missing row in median_finalfn");

      median = median_find_mean(median_state, val1, val2);
    }

    return median;
}

Datum median_find_mean(MedianState *median_state, Datum val1, Datum val2)
{
  
  TupleDesc tuple_desc;
  Form_pg_attribute attr;

  tuple_desc = median_state->agg_state->ss.ps.ps_ResultTupleDesc;             
  attr       = TupleDescAttr(tuple_desc, 0); 

  switch (median_state->datum_type)
  {
    case INT2OID: /*Handle small int */
    {
      int16 small_val1 = DatumGetInt16(val1);
      int16 small_val2 = DatumGetInt16(val2);

      if (small_val1 == small_val2)
        PG_RETURN_DATUM(val1);

      attr->atttypid = FLOAT4OID; 

      float4 float_mean = ((small_val1/2.0) + (small_val2/2.0));

      PG_RETURN_FLOAT4(float_mean);
    }
    case INT4OID: /* Handle integer */
    {
      int32 int_val1 = DatumGetInt32(val1);
      int32 int_val2 = DatumGetInt32(val2);
  
      if (int_val1 == int_val2)
        PG_RETURN_DATUM(val1);

      attr->atttypid = FLOAT4OID;

      float4 float_mean = (float4)((int_val1/2.0) + (int_val2/2.0));                                            
      PG_RETURN_FLOAT4(float_mean); 
    }
    case INT8OID:
    {
       int64 long_val1 = DatumGetInt64(val1);
       int64 long_val2 = DatumGetInt64(val2);

       if (long_val1 == long_val2)
         PG_RETURN_DATUM(val1);

       attr->atttypid = FLOAT8OID;

       float8 float_mean = ((long_val1/2.0) + (long_val2/2.0));                                            
       PG_RETURN_FLOAT8(float_mean);
    }
    case FLOAT4OID:
    {
       if (DirectFunctionCall2(float4eq, val1, val2))
          PG_RETURN_DATUM(val1);

       float4 float_val1 = DatumGetFloat4(val1);
       float4 float_val2 = DatumGetFloat4(val2);
       float4 float_mean = ((float_val1/2) + (float_val2/2));
       PG_RETURN_FLOAT4(float_mean);
    }
    case FLOAT8OID:
    {

      if (DirectFunctionCall2(float8eq, val1, val2))
        PG_RETURN_DATUM(val1);

      float8 f1 = DatumGetFloat8(val1);
      float8 f2 = DatumGetFloat8(val2);
      float8 fmean = (f1/2 + f2/2);
      PG_RETURN_FLOAT8(fmean);
    }
    case NUMERICOID:
    {

      if (DirectFunctionCall2(numeric_eq, val1, val2))
        PG_RETURN_DATUM(val1);
      Datum divisor, quotient1, quotient2, result;
      divisor = DirectFunctionCall1(int4_numeric, 2);
      quotient1 = DirectFunctionCall2(numeric_div, val1, divisor);
      quotient2 = DirectFunctionCall2(numeric_div, val2, divisor);
      result = DirectFunctionCall2(numeric_add, quotient1, quotient2);
      PG_RETURN_DATUM(result);
    }
    case CASHOID:
    {

      if (DirectFunctionCall2(cash_eq, val1, val2))
        PG_RETURN_DATUM(val1);

      Datum quotient1, quotient2, result;                              
      quotient1 = DirectFunctionCall2(cash_div_int8, val1, 2);              
      quotient2 = DirectFunctionCall2(cash_div_int8, val2, 2);              
      result = DirectFunctionCall2(cash_pl, quotient1, quotient2);          
      PG_RETURN_DATUM(result); 
    }
    case DATEOID:
    {
      Datum result;
      
      int32 diff_days, half_diff_days;
      
      if (DirectFunctionCall2(date_eq, val1, val2))
        PG_RETURN_DATUM(val1);

      diff_days = DirectFunctionCall2(date_mi, val2, val1);
      half_diff_days = diff_days / 2;
      result = DirectFunctionCall2(date_pli, val1, 
                                   half_diff_days);
      PG_RETURN_DATUM(result);
    }
    case TIMEOID:
    {

      Datum difference, half_difference, result;                                

      if (DirectFunctionCall2(time_eq, val1, val2))
        PG_RETURN_DATUM(val1);

      difference = DirectFunctionCall2(time_mi_time, val2, val1);               
      half_difference = DirectFunctionCall2(interval_div, difference,           
                                            Float8GetDatum((double)2));         
      result = DirectFunctionCall2(time_pl_interval, val1,                 
                                   half_difference);                            
      PG_RETURN_DATUM(result);       
    }
    case INTERVALOID:
    {
      Datum divisor, quotient1, quotient2, result;                              

      if (DirectFunctionCall2(interval_eq, val1, val2))
        PG_RETURN_DATUM(val1);

      divisor = Float8GetDatum((double)2);                           
      quotient1 = DirectFunctionCall2(interval_div, val1, divisor);              
      quotient2 = DirectFunctionCall2(interval_div, val2, divisor);              
      result = DirectFunctionCall2(interval_pl, quotient1, quotient2);          
      PG_RETURN_DATUM(result);  
    }                 
    case TIMETZOID:
    {
      Datum difference, half_difference, result;                                

      if (DirectFunctionCall2(timetz_eq, val1, val2))
        return val1;

      difference = DirectFunctionCall2(time_mi_time, val2, val1);               
      half_difference = DirectFunctionCall2(interval_div, difference,           
                                            Float8GetDatum((double)2));         
      result = DirectFunctionCall2(timetz_pl_interval, val1,                      
                                   half_difference);                            
      PG_RETURN_DATUM(result);
    }
    case TIMESTAMPOID:
    {
      Datum difference, half_difference, result;

      if (DirectFunctionCall2(timestamp_eq, val1, val2))
         PG_RETURN_DATUM(val1);

      difference = DirectFunctionCall2(timestamp_mi, val2, val1);
      half_difference = DirectFunctionCall2(interval_div, difference, 
                                            Float8GetDatum((double)2));
      result = DirectFunctionCall2(timestamp_pl_interval, val1, 
                                   half_difference);
      PG_RETURN_DATUM(result);
    }
    case TIMESTAMPTZOID:
    {
      Datum difference, half_difference, result;

      if (DirectFunctionCall2(timestamp_eq, val1, val2))                         
         PG_RETURN_DATUM(val1);

      difference = DirectFunctionCall2(timestamp_mi, val2, val1);
      half_difference = DirectFunctionCall2(interval_div, difference,
                                            Float8GetDatum((double)2));
      result = DirectFunctionCall2(timestamptz_pl_interval, val1, 
                                   half_difference);
      PG_RETURN_DATUM(result);
    }
    default:
    {
      /* For datatypes which mean calculation is not possible, return 
       * middle value.
       */
      return val1;
    }
  }
  return (Datum)0;
}

static inline bool median_is_supported_datatype(Oid dtype)
{
  
  switch (dtype)
  {
    case INT2OID: /*Handle small int */
    case INT4OID: /* Handle integer */
    case INT8OID:
    case FLOAT4OID:
    case FLOAT8OID:
    case NUMERICOID:
    case CASHOID: 
    case VARCHAROID:
    case BPCHAROID:
    case TEXTOID:
    case BYTEAOID:
    case DATEOID:
    case TIMESTAMPOID:
    case TIMESTAMPTZOID:
    case BOOLOID:
    case TIMEOID:
    case TIMETZOID:
    case INTERVALOID: 
    case ANYENUMOID: /* For ENUM attribute contains type id as 57646 */         
    case CIDROID:
    case INETOID:
    case MACADDROID:
    case MACADDR8OID:
    case BITOID:
    case VARBITOID:
    case TSVECTOROID:
    case TSQUERYOID:
    case UUIDOID: 
     return true;
    default:
    /* POINTOID */
    /* XMLOID */
    /* JSONOID */
      return false;
  }
  
}
