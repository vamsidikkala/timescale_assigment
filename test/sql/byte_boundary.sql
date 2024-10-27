-- BYTEA Data Types in PostgreSQL (Hex and Escape Format)

-- 1. BYTEA Hex Format Lower Bound Table
DROP TABLE IF EXISTS bytea_hex_lower_bound_even;
CREATE TABLE bytea_hex_lower_bound_even (id BYTEA);

-- Insert 4 rows with the lowest possible BYTEA value in hex format (empty bytea for lowest bound)
INSERT INTO bytea_hex_lower_bound_even VALUES (decode('', 'hex'));
INSERT INTO bytea_hex_lower_bound_even VALUES (decode('', 'hex'));
INSERT INTO bytea_hex_lower_bound_even VALUES (decode('', 'hex'));
INSERT INTO bytea_hex_lower_bound_even VALUES (decode('', 'hex'));

-- Select and order by id
SELECT * FROM bytea_hex_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bytea_hex_lower_bound_even;

-- 2. BYTEA Hex Format Upper Bound Table
DROP TABLE IF EXISTS bytea_hex_upper_bound_even;
CREATE TABLE bytea_hex_upper_bound_even (id BYTEA);

-- Insert 4 rows with the highest possible BYTEA value in hex format (e.g., max 16 bytes filled with 'FF' as sample upper bound)
INSERT INTO bytea_hex_upper_bound_even VALUES (decode('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF', 'hex'));
INSERT INTO bytea_hex_upper_bound_even VALUES (decode('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF', 'hex'));
INSERT INTO bytea_hex_upper_bound_even VALUES (decode('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF', 'hex'));
INSERT INTO bytea_hex_upper_bound_even VALUES (decode('FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF', 'hex'));

-- Select and order by id
SELECT * FROM bytea_hex_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bytea_hex_upper_bound_even;

-- 3. BYTEA Escape Format Lower Bound Table
DROP TABLE IF EXISTS bytea_escape_lower_bound_even;
CREATE TABLE bytea_escape_lower_bound_even (id BYTEA);

-- Insert 4 rows with the lowest possible BYTEA value in escape format (empty bytea for lowest bound)
INSERT INTO bytea_escape_lower_bound_even VALUES (E'\\x');
INSERT INTO bytea_escape_lower_bound_even VALUES (E'\\x');
INSERT INTO bytea_escape_lower_bound_even VALUES (E'\\x');
INSERT INTO bytea_escape_lower_bound_even VALUES (E'\\x');

-- Select and order by id
SELECT * FROM bytea_escape_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bytea_escape_lower_bound_even;

-- 4. BYTEA Escape Format Upper Bound Table
DROP TABLE IF EXISTS bytea_escape_upper_bound_even;
CREATE TABLE bytea_escape_upper_bound_even (id BYTEA);

-- Insert 4 rows with the highest possible BYTEA value in escape format (e.g., max 16 bytes filled with octal representation)
INSERT INTO bytea_escape_upper_bound_even VALUES (E'\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377');
INSERT INTO bytea_escape_upper_bound_even VALUES (E'\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377');
INSERT INTO bytea_escape_upper_bound_even VALUES (E'\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377');
INSERT INTO bytea_escape_upper_bound_even VALUES (E'\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377\\\\377');

-- Select and order by id
SELECT * FROM bytea_escape_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bytea_escape_upper_bound_even;

