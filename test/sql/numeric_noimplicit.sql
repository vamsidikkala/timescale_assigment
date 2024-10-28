-- Test case to test INTEGER data types
-- Basic purpose of this test case is to see whether SERVER TYPECASTs the 
-- result to FLOAT data type when even number of elements present in the result
-- set and all elements are equal. If elements present at n/2 and n/2 + 1 pos 
-- are equal, server shouldn't typecast the result to float for 
-- INT, SMALL INT, LARGE INT, SERIAL, SMALL SERIAL and BIG SERIAL data types.

-- This test inserts even number of elements 
-- (LOWEST POSSIBLE VALUE, HIGHEST POSSIBLE VALUE) into the table for each 
--  data type and cacluates the median. 

-- 1. SMALLINT Lower Bound Table

DROP TABLE IF EXISTS smallint_lower_bound_even;
CREATE TABLE smallint_lower_bound_even (id SMALLINT);

INSERT INTO smallint_lower_bound_even VALUES (-32768);
INSERT INTO smallint_lower_bound_even VALUES (-32768);
INSERT INTO smallint_lower_bound_even VALUES (-32768);
INSERT INTO smallint_lower_bound_even VALUES (-32768);

SELECT * FROM smallint_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM smallint_lower_bound_even;

-- 2. SMALLINT Upper Bound Table
DROP TABLE IF EXISTS smallint_upper_bound_even;
CREATE TABLE smallint_upper_bound_even (id SMALLINT);

INSERT INTO smallint_upper_bound_even VALUES (32767);
INSERT INTO smallint_upper_bound_even VALUES (32767);
INSERT INTO smallint_upper_bound_even VALUES (32767);
INSERT INTO smallint_upper_bound_even VALUES (32767);

SELECT * FROM smallint_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM smallint_upper_bound_even;

-- 3. INTEGER Lower Bound Table
DROP TABLE IF EXISTS integer_lower_bound_even;
CREATE TABLE integer_lower_bound_even (id INTEGER);

INSERT INTO integer_lower_bound_even VALUES (-2147483648);
INSERT INTO integer_lower_bound_even VALUES (-2147483648);
INSERT INTO integer_lower_bound_even VALUES (-2147483648);
INSERT INTO integer_lower_bound_even VALUES (-2147483648);

SELECT * FROM integer_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM integer_lower_bound_even;

-- 4. INTEGER Upper Bound Table
DROP TABLE IF EXISTS integer_upper_bound_even;
CREATE TABLE integer_upper_bound_even (id INTEGER);

INSERT INTO integer_upper_bound_even VALUES (2147483647);
INSERT INTO integer_upper_bound_even VALUES (2147483647);
INSERT INTO integer_upper_bound_even VALUES (2147483647);
INSERT INTO integer_upper_bound_even VALUES (2147483647);

SELECT * FROM integer_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM integer_upper_bound_even;

-- 5. BIGINT Lower Bound Table
DROP TABLE IF EXISTS bigint_lower_bound_even;
CREATE TABLE bigint_lower_bound_even (id BIGINT);

INSERT INTO bigint_lower_bound_even VALUES (-9223372036854775808);
INSERT INTO bigint_lower_bound_even VALUES (-9223372036854775808);
INSERT INTO bigint_lower_bound_even VALUES (-9223372036854775808);
INSERT INTO bigint_lower_bound_even VALUES (-9223372036854775808);

SELECT * FROM bigint_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM bigint_lower_bound_even;

-- 6. BIGINT Upper Bound Table
DROP TABLE IF EXISTS bigint_upper_bound_even;
CREATE TABLE bigint_upper_bound_even (id BIGINT);

INSERT INTO bigint_upper_bound_even VALUES (9223372036854775807);
INSERT INTO bigint_upper_bound_even VALUES (9223372036854775807);
INSERT INTO bigint_upper_bound_even VALUES (9223372036854775807);
INSERT INTO bigint_upper_bound_even VALUES (9223372036854775807);

SELECT * FROM bigint_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM bigint_upper_bound_even;

-- 7. DECIMAL Lower Bound Table
DROP TABLE IF EXISTS decimal_lower_bound_even;
CREATE TABLE decimal_lower_bound_even (id DECIMAL(38,0));

INSERT INTO decimal_lower_bound_even VALUES (-99999999999999999999999999999999999999);
INSERT INTO decimal_lower_bound_even VALUES (-99999999999999999999999999999999999999);
INSERT INTO decimal_lower_bound_even VALUES (-99999999999999999999999999999999999999);
INSERT INTO decimal_lower_bound_even VALUES (-99999999999999999999999999999999999999);

SELECT * FROM decimal_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM decimal_lower_bound_even;

-- 8. DECIMAL Upper Bound Table
DROP TABLE IF EXISTS decimal_upper_bound_even;
CREATE TABLE decimal_upper_bound_even (id DECIMAL(38,0));

INSERT INTO decimal_upper_bound_even VALUES (99999999999999999999999999999999999999);
INSERT INTO decimal_upper_bound_even VALUES (99999999999999999999999999999999999999);
INSERT INTO decimal_upper_bound_even VALUES (99999999999999999999999999999999999999);
INSERT INTO decimal_upper_bound_even VALUES (99999999999999999999999999999999999999);

SELECT * FROM decimal_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM decimal_upper_bound_even;


-- 9. NUMERIC Lower Bound Table
DROP TABLE IF EXISTS numeric_lower_bound_even;
CREATE TABLE numeric_lower_bound_even (id NUMERIC);

INSERT INTO numeric_lower_bound_even VALUES (-99999999999999999999999999999999999999);
INSERT INTO numeric_lower_bound_even VALUES (-99999999999999999999999999999999999999);
INSERT INTO numeric_lower_bound_even VALUES (-99999999999999999999999999999999999999);
INSERT INTO numeric_lower_bound_even VALUES (-99999999999999999999999999999999999999);

SELECT * FROM numeric_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM numeric_lower_bound_even;

-- 10. NUMERIC Upper Bound Table
DROP TABLE IF EXISTS numeric_upper_bound_even;
CREATE TABLE numeric_upper_bound_even (id NUMERIC);

INSERT INTO numeric_upper_bound_even VALUES (99999999999999999999999999999999999999);
INSERT INTO numeric_upper_bound_even VALUES (99999999999999999999999999999999999999);
INSERT INTO numeric_upper_bound_even VALUES (99999999999999999999999999999999999999);
INSERT INTO numeric_upper_bound_even VALUES (99999999999999999999999999999999999999);

SELECT * FROM numeric_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM numeric_upper_bound_even;

-- 11. REAL Lower Bound Table
DROP TABLE IF EXISTS real_lower_bound_even;
CREATE TABLE real_lower_bound_even (id REAL);

INSERT INTO real_lower_bound_even VALUES (-3.4028235E+38);
INSERT INTO real_lower_bound_even VALUES (-3.4028235E+38);
INSERT INTO real_lower_bound_even VALUES (-3.4028235E+38);
INSERT INTO real_lower_bound_even VALUES (-3.4028235E+38);

SELECT * FROM real_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM real_lower_bound_even;

-- 12. REAL Upper Bound Table
DROP TABLE IF EXISTS real_upper_bound_even;
CREATE TABLE real_upper_bound_even (id REAL);

INSERT INTO real_upper_bound_even VALUES (3.4028235E+38);
INSERT INTO real_upper_bound_even VALUES (3.4028235E+38);
INSERT INTO real_upper_bound_even VALUES (3.4028235E+38);
INSERT INTO real_upper_bound_even VALUES (3.4028235E+38);

SELECT * FROM real_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM real_upper_bound_even;

-- 13. DOUBLE PRECISION Lower Bound Table
DROP TABLE IF EXISTS double_precision_lower_bound_even;
CREATE TABLE double_precision_lower_bound_even (id DOUBLE PRECISION);

INSERT INTO double_precision_lower_bound_even VALUES (-1.7976931348623157E+308);
INSERT INTO double_precision_lower_bound_even VALUES (-1.7976931348623157E+308);
INSERT INTO double_precision_lower_bound_even VALUES (-1.7976931348623157E+308);
INSERT INTO double_precision_lower_bound_even VALUES (-1.7976931348623157E+308);

SELECT * FROM double_precision_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM double_precision_lower_bound_even;

-- 14. DOUBLE PRECISION Upper Bound Table
DROP TABLE IF EXISTS double_precision_upper_bound_even;
CREATE TABLE double_precision_upper_bound_even (id DOUBLE PRECISION);

INSERT INTO double_precision_upper_bound_even VALUES (1.7976931348623157E+308);
INSERT INTO double_precision_upper_bound_even VALUES (1.7976931348623157E+308);
INSERT INTO double_precision_upper_bound_even VALUES (1.7976931348623157E+308);
INSERT INTO double_precision_upper_bound_even VALUES (1.7976931348623157E+308);

SELECT * FROM double_precision_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM double_precision_upper_bound_even;

-- 15. SMALLSERIAL Lower Bound Table
DROP TABLE IF EXISTS smallserial_lower_bound_even;
CREATE TABLE smallserial_lower_bound_even (id SMALLINT GENERATED BY DEFAULT AS IDENTITY);

INSERT INTO smallserial_lower_bound_even VALUES (-32768);
INSERT INTO smallserial_lower_bound_even VALUES (-32768);
INSERT INTO smallserial_lower_bound_even VALUES (-32768);
INSERT INTO smallserial_lower_bound_even VALUES (-32768);

SELECT * FROM smallserial_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM smallserial_lower_bound_even;

-- 16. SMALLSERIAL Upper Bound Table
DROP TABLE IF EXISTS smallserial_upper_bound_even;
CREATE TABLE smallserial_upper_bound_even (id SMALLINT GENERATED BY DEFAULT AS IDENTITY);

INSERT INTO smallserial_upper_bound_even VALUES (32767);
INSERT INTO smallserial_upper_bound_even VALUES (32767);
INSERT INTO smallserial_upper_bound_even VALUES (32767);
INSERT INTO smallserial_upper_bound_even VALUES (32767);

SELECT * FROM smallserial_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM smallserial_upper_bound_even;

-- 17. SERIAL Lower Bound Table
DROP TABLE IF EXISTS serial_lower_bound_even;
CREATE TABLE serial_lower_bound_even (id INTEGER GENERATED BY DEFAULT AS IDENTITY);

INSERT INTO serial_lower_bound_even VALUES (-2147483648);
INSERT INTO serial_lower_bound_even VALUES (-2147483648);
INSERT INTO serial_lower_bound_even VALUES (-2147483648);
INSERT INTO serial_lower_bound_even VALUES (-2147483648);

SELECT * FROM serial_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM serial_lower_bound_even;

-- 18. SERIAL Upper Bound Table
DROP TABLE IF EXISTS serial_upper_bound_even;
CREATE TABLE serial_upper_bound_even (id INTEGER GENERATED BY DEFAULT AS IDENTITY);

INSERT INTO serial_upper_bound_even VALUES (2147483647);
INSERT INTO serial_upper_bound_even VALUES (2147483647);
INSERT INTO serial_upper_bound_even VALUES (2147483647);
INSERT INTO serial_upper_bound_even VALUES (2147483647);

SELECT * FROM serial_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM serial_upper_bound_even;

-- 19. BIGSERIAL Lower Bound Table
DROP TABLE IF EXISTS bigserial_lower_bound_even;
CREATE TABLE bigserial_lower_bound_even (id BIGINT GENERATED BY DEFAULT AS IDENTITY);

INSERT INTO bigserial_lower_bound_even VALUES (-9223372036854775808);
INSERT INTO bigserial_lower_bound_even VALUES (-9223372036854775808);
INSERT INTO bigserial_lower_bound_even VALUES (-9223372036854775808);
INSERT INTO bigserial_lower_bound_even VALUES (-9223372036854775808);

SELECT * FROM bigserial_lower_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM bigserial_lower_bound_even;

-- 20. BIGSERIAL Upper Bound Table
DROP TABLE IF EXISTS bigserial_upper_bound_even;
CREATE TABLE bigserial_upper_bound_even (id BIGINT GENERATED BY DEFAULT AS IDENTITY);

INSERT INTO bigserial_upper_bound_even VALUES (9223372036854775807);
INSERT INTO bigserial_upper_bound_even VALUES (9223372036854775807);
INSERT INTO bigserial_upper_bound_even VALUES (9223372036854775807);
INSERT INTO bigserial_upper_bound_even VALUES (9223372036854775807);

SELECT * FROM bigserial_upper_bound_even ORDER BY id;

SELECT median(id) AS median_value FROM bigserial_upper_bound_even;


