# Coding assignment: Median aggregate

The task of this coding assignment is to implement an aggregate
function that calculates the *median* over an input set (typically
values from a table). Documentation on how to create aggregates can be
found in the official PostgreSQL documentation under [User-defined
Aggregates](https://www.postgresql.org/docs/current/static/xaggr.html)


A typical median query is:

```sql
SELECT median(temp) FROM conditions;
```

## Compiling and installing

To compile and install the extension:

```bash
> make
> make install
```

Note, that depending on installation location, installing the
extension might require super-user permissions.

## Testing

Tests can be run with

```bash
> make installcheck
```

A few tests are provided with the coding assignment. All of these
tests should pass as is. Feel free to add additional tests.


## Design:

### Calculating the Median:
1. If the result set contains an odd number of elements, the median is the element at position `n/2` in the sorted set.
2. If the result set contains an even number of elements:
    - **Data types that support mean calculation**  
        - If the elements at position `n/2` and `n/2 + 1` are equal, return the element at `n/2` (no implicit conversion for NUMERIC data types).
        - If the elements are not equal, return the mean of the `n/2` and `n/2 + 1` elements (implicit conversion for NUMERIC data types).
    - **Data types that do not support mean calculation**  
        - Return the first middle element as the median.

### Algorithm:
The `tuplesort_*` interface is used for sorting the data, switches to an external tape sort when the result set size exceeds the `work_mem` parameter.\
After sorting, we use the steps in the "Calculating the Median" section to find the median.

### Data Type Support:
#### Supported Data Types
- All data types that support the `ORDER BY` functionality.
- For Object Identifier data type, we are not actually looking into the actual data type \
  it is pointing to. Instead we return first middle element in the even number result set.

#### Unsupported Data Types
- XML, JSON, and Geometric types. (All data types that are not supported with ORDER BY clause)

### Implicit Conversion:
Implicit conversion to the `FLOAT` data type will occur for `SMALLINT`, `INT`, `BIGINT`, `SMALLSERIAL`, `SERIAL`, and `BIGSERIAL` when the result set contains an even number of elements and the elements at `n/2` and `n/2 + 1` are not equal. If both elements are the same, no implicit conversion should occur.

### Testing:
- **datatype.sql(array.sql, bit.sql, byte.sql, boolean.sql, enum.sql etc)**  
  Tests include all supported data types. For each data type, we create two tables, `datatype_table_odd` (odd number of elements) and `datatype_table_even` (even number of elements), and run `SELECT MEDIAN(col)` on each table to simulate median behavior.

- **geometric.sql**  
  Test unsupported datatype POINT and LINE with MEDIAN().
  
- **datatype_large.sql**  
  Tests large datasets, ensuring `tuplesort*` API switches to external tape sort. We insert large data sets (>1 million rows) and query for the median.\
  1.5 million rows : bigint_large.sql big_serial_large.sql decimal_large.sql int_large.sql numeric_large.sql real_large.sql serial_large.sql \
    3 million rows : double_large.sql 

- **numeric_noimplicit.sql**  
  Tests whether the server typecasts the result to `FLOAT` when there are even number of elements in the result and all are equal. Here, elements at `n/2` and `n/2 + 1` are equal, so no implicit conversion should occur.
    - **Example**:
      ```sql
      CREATE TABLE TEST (COL1 INT);
      INSERT INTO TEST VALUES (2), (2), (2), (2);
      SELECT MEDIAN(COL1) FROM TEST;
      -- Expected Result: 2 (NOT 2.0)
      ```

- **numeric_mean.sql**  
  Tests if the server performs implicit conversion to `FLOAT` for `INT`, `SMALLINT`, `BIGINT`, `SERIAL`, `SMALLSERIAL`, and `BIGSERIAL` data types when there are even number of elements in result set, and elements at `n/2` and `n/2 + 1` aree not equal.
    - **Example**:
      ```sql
      CREATE TABLE TEST (COL1 INT);
      INSERT INTO TEST VALUES (1), (2), (3), (4);
      SELECT MEDIAN(COL1) FROM TEST;
      -- Expected Result: 2.5 (NOT 2)
      ```
  This also checks for potential overflows during mean calculation by inserting values as follows: \
     - **Example**
       ```sql
       INSERT INTO integer_mean VALUES (123456789) --random value
       INSERT INTO integer_mean VALUES (2147483646) -- MAX_VAL - 1
       INSERT INTO integer_mean VALUES (2147483647) -- MAX_VAL                                                               
       INSERT INTO integer_mean VALUES (2147483647) -- MAX_VAL
    - **Median Calculation**: `(MAX_VAL - 1 + MAX_VAL) / 2` --Check for overflow here

- **datetime_mean.sql**  
  Tests the mean operation for `INTERVAL`, `DATE`, `TIME`, and `TIMESTAMP` data types.

- **numeric_null.sql**  
  Test the NULL result-set. All column values are NULLs.
  
- **numeric_empty.sql**  
  Query empty table and see whether median() fails.
  
- **domain.sql**  
  Test domain data type. Also check whether median is calculated on the **base type** domain pointng to. To test this\
  we insert even number of elements in the domain table, and calcuate the median. Since base type is INT, returned result \
  should be implictly converted to FLOAT.
  
- **sort_collation.sql**  
  Test sort collation with JAPANESE text. Each langugage has different set of rules for sort ordering.\
  So test MEDIAN() handles different charset or not.    

  
