-- 1. smallint
DROP TABLE IF EXISTS smallint_table_odd;
DROP TABLE IF EXISTS smallint_table_even;

CREATE TABLE smallint_table_odd (id smallint);
CREATE TABLE smallint_table_even (id smallint);

INSERT INTO smallint_table_odd VALUES (3), (1), (5);  -- Odd count: 3 elements
INSERT INTO smallint_table_even VALUES (2), (4);       -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM smallint_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM smallint_table_odd;

SELECT * FROM smallint_table_even ORDER BY id;

SELECT MEDIAN(id) FROM smallint_table_even;


-- 2. integer
DROP TABLE IF EXISTS integer_table_odd;
DROP TABLE IF EXISTS integer_table_even;

CREATE TABLE integer_table_odd (id integer);
CREATE TABLE integer_table_even (id integer);

INSERT INTO integer_table_odd VALUES (30), (10), (20);  -- Odd count: 3 elements
INSERT INTO integer_table_even VALUES (15), (25);       -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM integer_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM integer_table_odd;

SELECT * FROM integer_table_even ORDER BY id;
SELECT MEDIAN(id) FROM integer_table_even;


-- 3. bigint
DROP TABLE IF EXISTS bigint_table_odd;
DROP TABLE IF EXISTS bigint_table_even;

CREATE TABLE bigint_table_odd (id bigint);
CREATE TABLE bigint_table_even (id bigint);

INSERT INTO bigint_table_odd VALUES (300), (100), (200);  -- Odd count: 3 elements
INSERT INTO bigint_table_even VALUES (150), (250);        -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM bigint_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM bigint_table_odd;

SELECT * FROM bigint_table_even ORDER BY id;

SELECT MEDIAN(id) FROM bigint_table_even;


-- 4. decimal
DROP TABLE IF EXISTS decimal_table_odd;
DROP TABLE IF EXISTS decimal_table_even;

CREATE TABLE decimal_table_odd (id decimal(10, 2));
CREATE TABLE decimal_table_even (id decimal(10, 2));

INSERT INTO decimal_table_odd VALUES (3.5), (1.5), (2.5);  -- Odd count: 3 elements
INSERT INTO decimal_table_even VALUES (1.2), (2.2);        -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM decimal_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM decimal_table_odd;

SELECT * FROM decimal_table_even ORDER BY id;

SELECT MEDIAN(id) FROM decimal_table_even;


-- 5. numeric
DROP TABLE IF EXISTS numeric_table_odd;
DROP TABLE IF EXISTS numeric_table_even;

CREATE TABLE numeric_table_odd (id numeric(10, 2));
CREATE TABLE numeric_table_even (id numeric(10, 2));

INSERT INTO numeric_table_odd VALUES (15.3), (10.2), (5.1);  -- Odd count: 3 elements
INSERT INTO numeric_table_even VALUES (12.2), (6.1);         -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM numeric_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM numeric_table_odd;

SELECT * FROM numeric_table_even ORDER BY id;

SELECT MEDIAN(id) FROM numeric_table_even;


-- 6. real
DROP TABLE IF EXISTS real_table_odd;
DROP TABLE IF EXISTS real_table_even;

CREATE TABLE real_table_odd (id real);
CREATE TABLE real_table_even (id real);

INSERT INTO real_table_odd VALUES (6.5), (2.5), (4.5);  -- Odd count: 3 elements
INSERT INTO real_table_even VALUES (5.3), (3.3);        -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM real_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM real_table_odd;

SELECT * FROM real_table_even ORDER BY id;

SELECT MEDIAN(id) FROM real_table_even;


-- 7. double precision
DROP TABLE IF EXISTS double_precision_table_odd;
DROP TABLE IF EXISTS double_precision_table_even;

CREATE TABLE double_precision_table_odd (id double precision);
CREATE TABLE double_precision_table_even (id double precision);

INSERT INTO double_precision_table_odd VALUES (3.33), (1.11), (2.22);  -- Odd count: 3 elements
INSERT INTO double_precision_table_even VALUES (0.2), (0.1);           -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM double_precision_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM double_precision_table_odd;

SELECT * FROM double_precision_table_even ORDER BY id;

SELECT MEDIAN(id) FROM double_precision_table_even;


-- 8. smallserial
DROP TABLE IF EXISTS smallserial_table_odd;
DROP TABLE IF EXISTS smallserial_table_even;

CREATE TABLE smallserial_table_odd (id smallserial);
CREATE TABLE smallserial_table_even (id smallserial);

-- Inserting values
INSERT INTO smallserial_table_odd DEFAULT VALUES;  -- Adds auto-incremented IDs
INSERT INTO smallserial_table_odd DEFAULT VALUES;
INSERT INTO smallserial_table_odd DEFAULT VALUES;  -- Odd count: 3 elements

INSERT INTO smallserial_table_even DEFAULT VALUES;
INSERT INTO smallserial_table_even DEFAULT VALUES; -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM smallserial_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM smallserial_table_odd;

SELECT * FROM smallserial_table_even ORDER BY id;

SELECT MEDIAN(id) FROM smallserial_table_even;


-- 9. serial
DROP TABLE IF EXISTS serial_table_odd;
DROP TABLE IF EXISTS serial_table_even;

CREATE TABLE serial_table_odd (id serial);
CREATE TABLE serial_table_even (id serial);

-- Inserting values
INSERT INTO serial_table_odd DEFAULT VALUES;
INSERT INTO serial_table_odd DEFAULT VALUES;
INSERT INTO serial_table_odd DEFAULT VALUES;  -- Odd count: 3 elements

INSERT INTO serial_table_even DEFAULT VALUES;
INSERT INTO serial_table_even DEFAULT VALUES; -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM serial_table_odd ORDER BY id;

SELECT MEDIAN(id) FROM serial_table_odd;

SELECT * FROM serial_table_even ORDER BY id;

SELECT MEDIAN(id) FROM serial_table_even;


-- 10. bigserial
DROP TABLE IF EXISTS bigserial_table_odd;
DROP TABLE IF EXISTS bigserial_table_even;

CREATE TABLE bigserial_table_odd (id bigserial);
CREATE TABLE bigserial_table_even (id bigserial);

-- Inserting values
INSERT INTO bigserial_table_odd DEFAULT VALUES;
INSERT INTO bigserial_table_odd DEFAULT VALUES;
INSERT INTO bigserial_table_odd DEFAULT VALUES;  -- Odd count: 3 elements

INSERT INTO bigserial_table_even DEFAULT VALUES;
INSERT INTO bigserial_table_even DEFAULT VALUES; -- Even count: 2 elements

-- Query with ORDER BY
SELECT * FROM bigserial_table_odd ORDER BY id;
SELECT MEDIAN(id) FROM bigserial_table_odd;

SELECT * FROM bigserial_table_even ORDER BY id;
SELECT MEDIAN(id) FROM bigserial_table_even;


