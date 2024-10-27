-- BIT and BIT VARYING Data Types in PostgreSQL

-- 1. BIT(8) Lower Bound Table
DROP TABLE IF EXISTS bit_lower_bound_even;
CREATE TABLE bit_lower_bound_even (id BIT(8));

-- Insert 4 rows with the lowest possible BIT(8) value (all bits set to 0)
INSERT INTO bit_lower_bound_even VALUES (B'00000000');
INSERT INTO bit_lower_bound_even VALUES (B'00000000');
INSERT INTO bit_lower_bound_even VALUES (B'00000000');
INSERT INTO bit_lower_bound_even VALUES (B'00000000');

-- Select and order by id
SELECT * FROM bit_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bit_lower_bound_even;

-- 2. BIT(8) Upper Bound Table
DROP TABLE IF EXISTS bit_upper_bound_even;
CREATE TABLE bit_upper_bound_even (id BIT(8));

-- Insert 4 rows with the highest possible BIT(8) value (all bits set to 1)
INSERT INTO bit_upper_bound_even VALUES (B'11111111');
INSERT INTO bit_upper_bound_even VALUES (B'11111111');
INSERT INTO bit_upper_bound_even VALUES (B'11111111');
INSERT INTO bit_upper_bound_even VALUES (B'11111111');

-- Select and order by id
SELECT * FROM bit_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bit_upper_bound_even;

-- 3. BIT VARYING(16) Lower Bound Table
DROP TABLE IF EXISTS bit_varying_lower_bound_even;
CREATE TABLE bit_varying_lower_bound_even (id BIT VARYING(16));

-- Insert 4 rows with the lowest possible BIT VARYING(16) value (all bits set to 0)
INSERT INTO bit_varying_lower_bound_even VALUES (B'0000000000000000');
INSERT INTO bit_varying_lower_bound_even VALUES (B'0000000000000000');
INSERT INTO bit_varying_lower_bound_even VALUES (B'0000000000000000');
INSERT INTO bit_varying_lower_bound_even VALUES (B'0000000000000000');

-- Select and order by id
SELECT * FROM bit_varying_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bit_varying_lower_bound_even;

-- 4. BIT VARYING(16) Upper Bound Table
DROP TABLE IF EXISTS bit_varying_upper_bound_even;
CREATE TABLE bit_varying_upper_bound_even (id BIT VARYING(16));

-- Insert 4 rows with the highest possible BIT VARYING(16) value (all bits set to 1)
INSERT INTO bit_varying_upper_bound_even VALUES (B'1111111111111111');
INSERT INTO bit_varying_upper_bound_even VALUES (B'1111111111111111');
INSERT INTO bit_varying_upper_bound_even VALUES (B'1111111111111111');
INSERT INTO bit_varying_upper_bound_even VALUES (B'1111111111111111');

-- Select and order by id
SELECT * FROM bit_varying_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bit_varying_upper_bound_even;


