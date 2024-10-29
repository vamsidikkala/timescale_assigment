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
#include <funcapi.h>
#include "utils/typcache.h"

#if PG_VERSION_NUM < 120000 || PG_VERSION_NUM >= 130000
#error "Unsupported PostgreSQL version. Use version 12."
#endif

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif


PG_FUNCTION_INFO_V1(median_transfn);

typedef struct
{
	Oid			datum_type;		/* Element type */
	Oid			sort_collation_id;	/* Language collation */
	Oid			sort_operator;	/* sort operator, "<" */
	int32		work_mem;		/* max amount of memory for sort operation */
	int64		total_elem;		/* total number of elements in result-set */
	Tuplesortstate *sortstate;
	AggState   *agg_state;
}			MedianState;


static MedianState * median_init_state(MemoryContext memoryCtx, Oid datum_type,
									   Oid collation);
static Datum median_calculate_mean(MedianState * median_state, Datum val1,
								   Datum val2);
static Datum median_calculate_median(MedianState * median_state);

/*
 * Name: median_init_state()
 *  Description: Initializes the median state and begins tuplesort
 */
static MedianState *
median_init_state(MemoryContext agg_context, Oid datum_type,
				  Oid sort_collation_id)
{
	MedianState *median_state = NULL;
	Oid			sort_op;
	bool		is_hashable;
	MemoryContext prev_context;
	const char *work_mem_str;

	prev_context = MemoryContextSwitchTo(agg_context);

	median_state = MemoryContextAllocZero(agg_context, sizeof(MedianState));

	median_state->datum_type = datum_type;

	median_state->sort_collation_id = sort_collation_id;

	/*
	 * Data types that are not supported with ORDER BY clause, are also not
	 * supported with MEDIAN() aggregate function.
	 */

	/*
	 * Try to get the sort operator for sorting the provided data type. If
	 * there is no sort operator for the data type, it means server cannot
	 * SORT elements of this data type. So we will let
	 * get_sort_group_operators() call to throw exception.
	 */
	get_sort_group_operators(datum_type, true, false, false, &sort_op, NULL,
							 NULL, &is_hashable);

	median_state->sort_operator = sort_op;

	work_mem_str = GetConfigOption("work_mem", false, false);
	median_state->work_mem = pg_atoi(work_mem_str, sizeof(int32), 0);

	median_state->sortstate
		= tuplesort_begin_datum(datum_type,
								median_state->sort_operator,
								median_state->sort_collation_id,
								false, median_state->work_mem,
								NULL, true);
	median_state->total_elem = 0;

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
	MedianState *median_state
	= (MedianState *) (PG_ARGISNULL(0) ? NULL : PG_GETARG_POINTER(0));
	Oid			datum_type;

	if (!AggCheckCallContext(fcinfo, &agg_context))
		elog(ERROR, "median_transfn called in non-aggregate context");

	if (median_state == NULL)
	{

		datum_type = get_fn_expr_argtype(fcinfo->flinfo, 1);

		if (!OidIsValid(datum_type))
			elog(ERROR, "median_transfn called with unknown datatype");

		median_state = median_init_state(agg_context, datum_type,
										 fcinfo->fncollation);
		median_state->agg_state = (AggState *) fcinfo->context;

	}

	if (PG_ARGISNULL(1))
		goto finally;

	tuplesort_putdatum(median_state->sortstate, PG_GETARG_DATUM(1),
					   PG_ARGISNULL(1));

	median_state->total_elem++;

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
	MedianState *median_state = NULL;
	Datum		median;

	if (!AggCheckCallContext(fcinfo, &agg_context))
		elog(ERROR, "median_finalfn called in non-aggregate context");

	median_state =
		(MedianState *) (PG_ARGISNULL(0) ? NULL : PG_GETARG_POINTER(0));

	if (median_state == NULL || median_state->total_elem == 0)
		PG_RETURN_NULL();

	tuplesort_performsort(median_state->sortstate);

	median = median_calculate_median(median_state);

	tuplesort_end(median_state->sortstate);

	PG_RETURN_DATUM(median);
}

static Datum
median_calculate_median(MedianState * median_state)
{
	int64		mid_elem_idx = median_state->total_elem / 2;
	Datum		median;
	bool		isNull;

	if (median_state->total_elem % 2 == 1)
	{

		/* skip floor(n/2) elements */
		if (!tuplesort_skiptuples(median_state->sortstate,
								  mid_elem_idx, true))
			elog(ERROR, "missing row in median_finalfn");

		/* Null is not expected, so we don't check for nulls */
		if (!tuplesort_getdatum(median_state->sortstate, true, &median, &isNull,
								NULL))
			elog(ERROR, "missing row in median_finalfn");

	}
	else
	{
		Datum		val1,
					val2;

		/* Skip first n/2 - 1 elements */
		if (!tuplesort_skiptuples(median_state->sortstate,
								  mid_elem_idx - 1, true))
			elog(ERROR, "missing row in median_finalfn");

		/* Null is not expected, so we don't check for nulls */
		/* Get n/2 element */
		if (!tuplesort_getdatum(median_state->sortstate, true, &val1, &isNull,
								NULL))
			elog(ERROR, "missing row in median_finalfn");

		/* Get (n/2) + 1 element */
		if (!tuplesort_getdatum(median_state->sortstate, true, &val2, &isNull,
								NULL))
			elog(ERROR, "missing row in median_finalfn");

		/* Now calculate the median */
		median = median_calculate_mean(median_state, val1, val2);
	}

	return median;
}


/*
 *   Name: median_calculate_mean()
 *   Description: Given two middle datums, calculates and returns the mean.
 *   Two cases to consider
 *   1) Data types that support interpolation of two values
 *      i) If n/2 and n/2 + 1 are equal, just return the n/2 element
 *         Note: We will not override INT2OID, INT4OID and INT8OID attr types.
 *     ii) If n/2 and n/2 + 1 are different, calcuate the mean and return the
 *         mean.
 *         Note: For data types INT2OID, INT4OID and INT8OID, attribute type will
 *               be overrided with corresponding FLOAT data type. This hack
 *               forces Server to send data in FLOAT format.
 *   2) Data types that doesn't support interpoltion of two values.
 *      Returns first middle element (n/2) as mean.
 */

static Datum
median_calculate_mean(MedianState * median_state, Datum val1, Datum val2)
{

	TupleDesc	tuple_desc;
	Form_pg_attribute attr;
	Oid			baseType = median_state->datum_type;
	TypeCacheEntry *typentry;

	tuple_desc = median_state->agg_state->ss.ps.ps_ResultTupleDesc;
	attr = TupleDescAttr(tuple_desc, 0);

	/* Get the base type for DOMAIN data type */

	typentry = lookup_type_cache(baseType, TYPECACHE_DOMAIN_BASE_INFO);
	if (typentry->typtype == TYPTYPE_DOMAIN)
	{
		if (!OidIsValid(typentry->domainBaseType))
			elog(ERROR, "median_finalfn called with unknown datatype");
		baseType = typentry->domainBaseType;
	}
	switch (baseType)
	{
		case INT2OID:
			{
				int16		small_val1 = DatumGetInt16(val1);
				int16		small_val2 = DatumGetInt16(val2);
				Datum		diff,
							half_diff,
							mean;

				if (small_val1 == small_val2)
					PG_RETURN_DATUM(val1);

				/*
				 * override the attribute type to FLOAT, to ensure server
				 * sends median in float format.
				 */
				attr->atttypid = FLOAT4OID;

				diff = DirectFunctionCall2(float4mi,
										   Float4GetDatum(small_val2),
										   Float4GetDatum(small_val1));
				half_diff = DirectFunctionCall2(float4div, diff,
												Float4GetDatum(2));

				mean = DirectFunctionCall2(float4pl,
										   Float4GetDatum(small_val1),
										   half_diff);

				PG_RETURN_DATUM(mean);

			}
		case INT4OID:
			{
				int32		int_val1 = DatumGetInt32(val1);
				int32		int_val2 = DatumGetInt32(val2);
				Datum		diff,
							half_diff,
							mean;

				if (int_val1 == int_val2)
					PG_RETURN_DATUM(val1);

				/*
				 * override the attribute type to FLOAT, to ensure server
				 * sends median in  float format.
				 */
				attr->atttypid = FLOAT4OID;

				diff = DirectFunctionCall2(float4mi, Float4GetDatum(int_val2),
										   Float4GetDatum(int_val1));
				half_diff = DirectFunctionCall2(float4div, diff,
												Float4GetDatum(2));

				mean = DirectFunctionCall2(float4pl, Float4GetDatum(int_val1),
										   half_diff);

				PG_RETURN_DATUM(mean);
			}
		case INT8OID:
			{

				int64		long_val1 = DatumGetInt64(val1);
				int64		long_val2 = DatumGetInt64(val2);

				Datum		diff,
							half_diff,
							mean;

				if (long_val1 == long_val2)
					PG_RETURN_DATUM(val1);

				/*
				 * override the attribute type to FLOAT8OID, to ensure server
				 * sends median in  float format.
				 */
				attr->atttypid = FLOAT8OID;

				diff = DirectFunctionCall2(float8mi, Float8GetDatum(long_val2),
										   Float8GetDatum(long_val1));
				half_diff = DirectFunctionCall2(float8div, diff,
												Float8GetDatum(2));

				mean = DirectFunctionCall2(float8pl, Float8GetDatum(long_val1),
										   half_diff);

				PG_RETURN_DATUM(mean);
			}
		case FLOAT4OID:
			{
				Datum		diff,
							half_diff,
							mean;

				if (DirectFunctionCall2(float4eq, val1, val2))
					PG_RETURN_DATUM(val1);

				diff = DirectFunctionCall2(float4mi, val2, val1);
				half_diff = DirectFunctionCall2(float4div, diff,
												Float4GetDatum(2));

				mean = DirectFunctionCall2(float4pl, val1, half_diff);

				PG_RETURN_DATUM(mean);
			}
		case FLOAT8OID:
			{

				Datum		diff,
							half_diff,
							mean;

				if (DirectFunctionCall2(float8eq, val1, val2))
					PG_RETURN_DATUM(val1);

				diff = DirectFunctionCall2(float8mi, val2, val1);
				half_diff = DirectFunctionCall2(float8div, diff,
												Float8GetDatum(2));

				mean = DirectFunctionCall2(float8pl, val1, half_diff);

				PG_RETURN_DATUM(mean);

			}
		case NUMERICOID:
			{

				Datum		divisor,
							quotient1,
							quotient2,
							mean;

				if (DirectFunctionCall2(numeric_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				divisor = DirectFunctionCall1(int4_numeric, 2);
				quotient1 = DirectFunctionCall2(numeric_div, val1, divisor);
				quotient2 = DirectFunctionCall2(numeric_div, val2, divisor);
				mean = DirectFunctionCall2(numeric_add, quotient1, quotient2);
				PG_RETURN_DATUM(mean);
			}
		case CASHOID:
			{

				Datum		quotient1,
							quotient2,
							mean;

				if (DirectFunctionCall2(cash_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				quotient1 = DirectFunctionCall2(cash_div_int8, val1, 2);
				quotient2 = DirectFunctionCall2(cash_div_int8, val2, 2);
				mean = DirectFunctionCall2(cash_pl, quotient1, quotient2);
				PG_RETURN_DATUM(mean);
			}
		case DATEOID:
			{
				Datum		mean;

				int32		diff_days,
							half_diff_days;

				if (DirectFunctionCall2(date_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				diff_days = DirectFunctionCall2(date_mi, val2, val1);
				half_diff_days = diff_days / 2;
				mean = DirectFunctionCall2(date_pli, val1,
										   half_diff_days);
				PG_RETURN_DATUM(mean);
			}
		case TIMEOID:
			{

				Datum		difference,
							half_diff,
							mean;

				if (DirectFunctionCall2(time_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				difference = DirectFunctionCall2(time_mi_time, val2, val1);
				half_diff = DirectFunctionCall2(interval_div, difference,
												Float8GetDatum((double) 2));
				mean = DirectFunctionCall2(time_pl_interval, val1,
										   half_diff);
				PG_RETURN_DATUM(mean);
			}
		case INTERVALOID:
			{
				Datum		divisor,
							quotient1,
							quotient2,
							mean;

				if (DirectFunctionCall2(interval_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				divisor = Float8GetDatum((double) 2);
				quotient1 = DirectFunctionCall2(interval_div, val1, divisor);
				quotient2 = DirectFunctionCall2(interval_div, val2, divisor);
				mean = DirectFunctionCall2(interval_pl, quotient1, quotient2);
				PG_RETURN_DATUM(mean);
			}
		case TIMETZOID:
			{
				Datum		difference,
							half_diff,
							mean;

				if (DirectFunctionCall2(timetz_eq, val1, val2))
					return val1;

				difference = DirectFunctionCall2(time_mi_time, val2, val1);
				half_diff = DirectFunctionCall2(interval_div, difference,
												Float8GetDatum((double) 2));
				mean = DirectFunctionCall2(timetz_pl_interval, val1,
										   half_diff);
				PG_RETURN_DATUM(mean);
			}
		case TIMESTAMPOID:
			{
				Datum		difference,
							half_diff,
							mean;

				if (DirectFunctionCall2(timestamp_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				difference = DirectFunctionCall2(timestamp_mi, val2, val1);
				half_diff = DirectFunctionCall2(interval_div, difference,
												Float8GetDatum((double) 2));
				mean = DirectFunctionCall2(timestamp_pl_interval, val1,
										   half_diff);
				PG_RETURN_DATUM(mean);
			}
		case TIMESTAMPTZOID:
			{
				Datum		difference,
							half_diff,
							mean;

				if (DirectFunctionCall2(timestamp_eq, val1, val2))
					PG_RETURN_DATUM(val1);

				difference = DirectFunctionCall2(timestamp_mi, val2, val1);
				half_diff = DirectFunctionCall2(interval_div, difference,
												Float8GetDatum((double) 2));
				mean = DirectFunctionCall2(timestamptz_pl_interval, val1,
										   half_diff);
				PG_RETURN_DATUM(mean);
			}
		default:
			{
				/*
				 * For datatypes which mean calculation is not possible,
				 * return first middle value.
				 */
				return val1;
			}
	}
	return (Datum) 0;
}
