-- Test case to test INTEGER data types
-- Basic purpose of this test case is to see whether SERVER TYPECASTs the 
-- result to FLOAT data type when even number of elements present in the result
-- set and all elements are not equal. If elements present at n/2 and 
-- n/2 + 1 position are not same, server SHOULD TYPECAST the RESULT to FLOAT for 
-- INT, SMALL INT, LARGE INT, SERIAL, SMALL SERIAL and BIG SERIAL data types.

-- Also we are testing for OVERFLOWs by inserting large values at positions
-- n/2 and n/2 + 1 and calculating the mean of two large elements.

-- This test inserts even number of elements 
-- (random number, 
--  number close to upper bound, 
--  MAX_VAL,
--  MAX_VAL
--  into the table for each numerical data type and cacluates the median. 

-- 1. Smallint
DROP TABLE IF EXISTS smallint_mean;
CREATE TABLE smallint_mean (id SMALLINT);

INSERT INTO smallint_mean VALUES 
    (12345),  
    (32766),  
    (32767),  
    (32767);  

SELECT * FROM smallint_mean ORDER BY id;

SELECT median(id) AS median_value FROM smallint_mean;


-- 2. Integer
DROP TABLE IF EXISTS integer_mean;
CREATE TABLE integer_mean (id INTEGER);

INSERT INTO integer_mean VALUES 
    (123456789),  
    (2147483646),  
    (2147483647),  
    (2147483647);  

SELECT * FROM integer_mean ORDER BY id;

SELECT median(id) AS median_value FROM integer_mean;


-- 3. Bigint
DROP TABLE IF EXISTS bigint_mean;
CREATE TABLE bigint_mean (id BIGINT);

INSERT INTO bigint_mean VALUES 
    (12345678901234),  
    (9223372036854775806),  
    (9223372036854775807),  
    (9223372036854775807);

SELECT * FROM bigint_mean ORDER BY id;

SELECT median(id) AS median_value FROM bigint_mean;


-- 4. Decimal
DROP TABLE IF EXISTS decimal_mean;
CREATE TABLE decimal_mean (id DECIMAL);

INSERT INTO decimal_mean VALUES 
    (12345.67),  
    (999999999999999.99),
    (1000000000000000.00),  
    (1000000000000000.00);  

SELECT * FROM decimal_mean ORDER BY id;

SELECT median(id) AS median_value FROM decimal_mean;


-- 5. Numeric
DROP TABLE IF EXISTS numeric_mean;
CREATE TABLE numeric_mean (id NUMERIC);

INSERT INTO numeric_mean VALUES 
    (12345.6789),  
    (999999999999999.99),
    (1000000000000000.00),  
    (1000000000000000.00);  

SELECT * FROM numeric_mean ORDER BY id;

SELECT median(id) AS median_value FROM numeric_mean;


-- 6. Real
DROP TABLE IF EXISTS real_mean;
CREATE TABLE real_mean (id REAL);

INSERT INTO real_mean VALUES 
    (123.456),  
    (3.402823466E+38 - 0.00001),  
    (3.402823466E+38),  
    (3.402823466E+38);

SELECT * FROM real_mean ORDER BY id;

SELECT median(id) AS median_value FROM real_mean;


-- 7. Double Precision
DROP TABLE IF EXISTS double_precision_mean;
CREATE TABLE double_precision_mean (id DOUBLE PRECISION);

INSERT INTO double_precision_mean VALUES 
    (12345.678901234567),  
    (1.7976931348623157E+308 - 0.00001),
    (1.7976931348623157E+308),  
    (1.7976931348623157E+308);  

SELECT * FROM double_precision_mean ORDER BY id;

SELECT median(id) AS median_value FROM double_precision_mean;


-- 8. Smallserial
DROP TABLE IF EXISTS smallserial_mean;
CREATE TABLE smallserial_mean (id SMALLSERIAL);

INSERT INTO smallserial_mean VALUES 
    (12345),  
    (32766),  
    (32767),  
    (32767);  

SELECT * FROM smallserial_mean ORDER BY id;

SELECT median(id) AS median_value FROM smallserial_mean;


-- 9. Serial
DROP TABLE IF EXISTS serial_mean;
CREATE TABLE serial_mean (id SERIAL);

INSERT INTO serial_mean VALUES 
    (123456),  
    (2147483646),
    (2147483647),  
    (2147483647);  

SELECT * FROM serial_mean ORDER BY id;

SELECT median(id) AS median_value FROM serial_mean;


-- 10. Bigserial
DROP TABLE IF EXISTS bigserial_mean;
CREATE TABLE bigserial_mean (id BIGSERIAL);

INSERT INTO bigserial_mean VALUES 
    (12345678901234),  
    (9223372036854775806),  
    (9223372036854775807),  
    (9223372036854775807);  

SELECT * FROM bigserial_mean ORDER BY id;

SELECT median(id) AS median_value FROM bigserial_mean;


