-- BYTEA Data Types in PostgreSQL (hex and escape formats)

-- 1. bytea in hex format
DROP TABLE IF EXISTS bytea_hex_table_odd;
DROP TABLE IF EXISTS bytea_hex_table_even;

CREATE TABLE bytea_hex_table_odd (id bytea);
CREATE TABLE bytea_hex_table_even (id bytea);

-- Insert 5 values into the odd table
INSERT INTO bytea_hex_table_odd VALUES (decode('4d79537472696e67', 'hex')); -- MyString
INSERT INTO bytea_hex_table_odd VALUES (decode('5465737444617461', 'hex')); -- TestData
INSERT INTO bytea_hex_table_odd VALUES (decode('48656c6c6f', 'hex'));       -- Hello
INSERT INTO bytea_hex_table_odd VALUES (decode('426974436f6465', 'hex'));   -- BitCode
INSERT INTO bytea_hex_table_odd VALUES (decode('4f6464537472', 'hex'));     -- OddStr

-- Insert 4 values into the even table
INSERT INTO bytea_hex_table_even VALUES (decode('4d79537472696e67', 'hex')); -- MyString
INSERT INTO bytea_hex_table_even VALUES (decode('5465737444617461', 'hex')); -- TestData
INSERT INTO bytea_hex_table_even VALUES (decode('48656c6c6f', 'hex'));       -- Hello
INSERT INTO bytea_hex_table_even VALUES (decode('426974436f6465', 'hex'));   -- BitCode

-- Order by statement
SELECT * FROM bytea_hex_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM bytea_hex_table_odd;

SELECT * FROM bytea_hex_table_even ORDER BY id;

SELECT median(id) AS median_value FROM bytea_hex_table_even;

-- 2. bytea in escape format
DROP TABLE IF EXISTS bytea_escape_table_odd;
DROP TABLE IF EXISTS bytea_escape_table_even;

CREATE TABLE bytea_escape_table_odd (id bytea);
CREATE TABLE bytea_escape_table_even (id bytea);

-- Insert 5 values into the odd table
INSERT INTO bytea_escape_table_odd VALUES (E'\\x4d79537472696e67'); -- MyString
INSERT INTO bytea_escape_table_odd VALUES (E'\\x5465737444617461'); -- TestData
INSERT INTO bytea_escape_table_odd VALUES (E'\\x48656c6c6f');       -- Hello
INSERT INTO bytea_escape_table_odd VALUES (E'\\x426974436f6465');   -- BitCode
INSERT INTO bytea_escape_table_odd VALUES (E'\\x4f6464537472');     -- OddStr

-- Insert 4 values into the even table
INSERT INTO bytea_escape_table_even VALUES (E'\\x4d79537472696e67'); -- MyString
INSERT INTO bytea_escape_table_even VALUES (E'\\x5465737444617461'); -- TestData
INSERT INTO bytea_escape_table_even VALUES (E'\\x48656c6c6f');       -- Hello
INSERT INTO bytea_escape_table_even VALUES (E'\\x426974436f6465');   -- BitCode

-- Order by statement
SELECT * FROM bytea_escape_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM bytea_escape_table_odd;

SELECT * FROM bytea_escape_table_even ORDER BY id;

SELECT median(id) AS median_value FROM bytea_escape_table_even;

