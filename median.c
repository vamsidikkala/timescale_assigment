#include <postgres.h>
#include <fmgr.h>

//#if PG_VERSION_NUM < 120000 || PG_VERSION_NUM >= 130000

#if PG_VERSION_NUM < 120000
#error "Unsupported PostgreSQL version. Use version 12."
#endif

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

PG_FUNCTION_INFO_V1(median_transfn);

typedef struct
{
  Datum *array;
  size_t size;
  size_t capacity;
  Oid datum_type;
}median_t;

median_t *median_init(MemoryContext memoryCtx, Oid datum_type);

//median_t *medianCtx;

median_t *median_init(MemoryContext memoryCtx, Oid datum_type)
{
    median_t *medianCtx = NULL;
    
    MemoryContextSwitchTo(memoryCtx);
    medianCtx = MemoryContextAllocZero(memoryCtx, sizeof(median_t));
    medianCtx->size = 0;
    medianCtx->capacity = 128; /* Hold 128 items initially */
    medianCtx->array = MemoryContextAllocZero(memoryCtx, sizeof(Datum) * medianCtx->capacity);
    medianCtx->datum_type = datum_type;
    return medianCtx;
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

    median_t *medianCtx = NULL;

    if (!AggCheckCallContext(fcinfo, &agg_context))
        elog(ERROR, "median_transfn called in non-aggregate context");

    if (PG_ARGISNULL(0))
        medianCtx = median_init(agg_context, get_fn_expr_argtype(fcinfo->flinfo, 1)); 
    else
        medianCtx = (median_t *) PG_GETARG_POINTER(0);

    if (PG_ARGISNULL(0))
        PG_RETURN_POINTER(medianCtx);

    if (medianCtx->size == medianCtx->capacity)
        elog(ERROR, "median_transfn can't handle more than 100 elements");

    medianCtx->array[medianCtx->size++] = PG_GETARG_DATUM(1); 

    PG_RETURN_POINTER(medianCtx);
 //   PG_RETURN_NULL();
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
    median_t *medianCtx = NULL;
    Datum median;
    size_t size = 0;

    if (!AggCheckCallContext(fcinfo, &agg_context))
        elog(ERROR, "median_finalfn called in non-aggregate context");

    medianCtx = (median_t *) (PG_ARGISNULL(0) ? NULL: PG_GETARG_POINTER(0));
    if (medianCtx == NULL)
      PG_RETURN_NULL();

    if (medianCtx->size == 0)
      PG_RETURN_NULL();

    size = size + 1;
    median = medianCtx->array[0];
    size = size + 1;
    PG_RETURN_DATUM(median);
    //PG_RETURN_NULL();
}
