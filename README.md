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

### Calculating the median:
1) If Result set contains odd number of elements in the sorted result set, n/2 element is the median
2) else,
    i) Datatypes that support calculation of mean
        -> if both n/2 and n/2 + 1 elements are same, return n/2 element (no implicit conversion for NUMERIC data types)
        -> if both n/2 and n/2 + 1 are different, return mean of n/2 and n/2 + 1 elements. (Implicit conversion for NUMERIC data types)
   ii) Data types that doesn't support mean, return first middle element as mean.

### Algorithm:
    tuplesort_* interface is used for sorting the data. tuplesort switches to external tape sort when result-set
    size is greater than work_mem parameter.
    After sorting the data, we follow steps mentioned in Calculating the median section for finding the median.

### Data type Support:
#### Supported data types
      All datatypes which support ORDER BY functionality are supported.
#### Unsupported data types
     XML, JSON, Geometric Types.

### Implicit Conversion:
   Implcit conversion to the FLOAT data type will be performed for the data types SMALL, INT, BIGINT, SMALL SERIAL, 
  SERIAL, BIGSERIAL datatypes, when result set contains even number of elements and n/2 and n/2 + 1 elements are not 
  equal. If both n/2 and n/2+1 elements are same, then implicit conversion shouldn't happen.


### Testing:
   datatype.sql - Tests added with all supported data types. 
                  In test we create two tables in the format datatype_table_odd for storing the odd number 
                  elements and datatype_table_even for storing the even number of elements. Then we query
                  with SELECT MEDIAN(col) from table_name. This is to simulate the behaviour 
                  of median() with odd/even number of elements.

   datatype_large.sql - Test large data sets
                        Purpose of these testcases are to force tuplesort* API to use external tape sort.
                        We do this by inserting large data ( > 1 million rows)) and querying the median.
   
   numeric_noimplicit.sql: The purpose of this test case is to see whether SERVER TYPECASTs the result 
                            to FLOAT data type when even number of elements present in the result set 
                            and all elements are equal. In this test, elements present at N/2 and N/2 + 1
                            position are equal, so server shouldn't perform implicit conversion.
                            Example: CREATE TABLE TEST(COL1 INT);
                                     INSERT INTO TEST VALUES (2),(2),(2),(2).
                                     SELECT MEDIAN(COL1) FROM TEST
                                     MEDIAN
                                     -------
                                       2 (NOT 2.0)
    
     numeric_mean.sql: The purpose of this test case is to see whether SERVER performs implcit conversion of the
                      result to FLOAT data type, when even number of elements present in the result set and all 
                      elements are equal. In this test, elements present at n/2 and n/2 + 1 position are equal, server
                      should implcitly convert the result to FLOAT data type for data types
                      INT, SMALL INT, LARGE INT, SERIAL, SMALL SERIAL and BIG SERIAL data types.   
                      Example: CREATE TABLE TEST(COL1 INT);
                               INSERT INTO TEST VALUES (1),(2),(3),(4).
                               SELECT MEDIAN(COL1) FROM TEST
                                MEDIAN
                                -------
                                  2.5 (NOT 2)
                     Also this testcase checks for potential overflows when mean operation is performed.
                     This we simulate by inserting 4 rows in below format for each data type.
                       (random value)                                                              
                       (close to MAX_VAL) --> n/2                                            
                       (  MAX_VAL) --> n/2 + 1                                                
                       ( MAX_VAL )  
                    median = ((close to MAX_VAL) + MAX_VAL) / 2;
                    
      datetime_meam.sql: Test mean operation for interval/date/time/timestamp data types.
      



