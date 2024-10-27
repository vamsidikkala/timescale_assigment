-- Character Data Types in PostgreSQL

-- 1. VARCHAR(n) Lower Bound Table
DROP TABLE IF EXISTS varchar_lower_bound_even;
CREATE TABLE varchar_lower_bound_even (id VARCHAR(100));

-- Insert 4 rows with the lowest possible VARCHAR(100) value (empty string)
INSERT INTO varchar_lower_bound_even VALUES (''), (''), (''), ('');

-- Select and order by id
SELECT * FROM varchar_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM varchar_lower_bound_even;

-- 2. VARCHAR(n) Upper Bound Table
DROP TABLE IF EXISTS varchar_upper_bound_even;
CREATE TABLE varchar_upper_bound_even (id VARCHAR(100));

-- Insert 4 rows with the highest possible VARCHAR(100) value (100 characters)
INSERT INTO varchar_upper_bound_even VALUES ('X' || repeat('X', 99)), ('X' || repeat('X', 99)), ('X' || repeat('X', 99)), ('X' || repeat('X', 99));

-- Select and order by id
SELECT * FROM varchar_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM varchar_upper_bound_even;

-- 3. CHAR(n) Lower Bound Table
DROP TABLE IF EXISTS char_lower_bound_even;
CREATE TABLE char_lower_bound_even (id CHAR(100));

-- Insert 4 rows with the lowest possible CHAR(100) value (empty or spaces)
INSERT INTO char_lower_bound_even VALUES (' '), (' '), (' '), (' ');

-- Select and order by id
SELECT * FROM char_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM char_lower_bound_even;

-- 4. CHAR(n) Upper Bound Table
DROP TABLE IF EXISTS char_upper_bound_even;
CREATE TABLE char_upper_bound_even (id CHAR(100));

-- Insert 4 rows with the highest possible CHAR(100) value (100 characters, space-padded)
INSERT INTO char_upper_bound_even VALUES ('Y' || repeat('Y', 99)), ('Y' || repeat('Y', 99)), ('Y' || repeat('Y', 99)), ('Y' || repeat('Y', 99));

-- Select and order by id
SELECT * FROM char_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM char_upper_bound_even;

-- 5. BPCHAR (variable unlimited length, blank-trimmed) Lower Bound Table
DROP TABLE IF EXISTS bpchar_lower_bound_even;
CREATE TABLE bpchar_lower_bound_even (id BPCHAR);

-- Insert 4 rows with the lowest possible BPCHAR value (empty string, blank-trimmed)
INSERT INTO bpchar_lower_bound_even VALUES (''), (''), (''), ('');

-- Select and order by id
SELECT * FROM bpchar_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bpchar_lower_bound_even;

-- 6. BPCHAR (variable unlimited length, blank-trimmed) Upper Bound Table
DROP TABLE IF EXISTS bpchar_upper_bound_even;
CREATE TABLE bpchar_upper_bound_even (id BPCHAR);

-- Insert 4 rows with the highest possible BPCHAR value (considering a sample of 100 characters as upper bound)
INSERT INTO bpchar_upper_bound_even VALUES ('Z' || repeat('Z', 99)), ('Z' || repeat('Z', 99)), ('Z' || repeat('Z', 99)), ('Z' || repeat('Z', 99));

-- Select and order by id
SELECT * FROM bpchar_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM bpchar_upper_bound_even;

-- 7. TEXT Lower Bound Table
DROP TABLE IF EXISTS text_lower_bound_even;
CREATE TABLE text_lower_bound_even (id TEXT);

-- Insert 4 rows with the lowest possible TEXT value (empty string)
INSERT INTO text_lower_bound_even VALUES (''), (''), (''), ('');

-- Select and order by id
SELECT * FROM text_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM text_lower_bound_even;

-- 8. TEXT Upper Bound Table
DROP TABLE IF EXISTS text_upper_bound_even;
CREATE TABLE text_upper_bound_even (id TEXT);

-- Insert 4 rows with a sample highest possible TEXT value (100 characters, as upper bound example)
INSERT INTO text_upper_bound_even VALUES ('A' || repeat('A', 99)), ('A' || repeat('A', 99)), ('A' || repeat('A', 99)), ('A' || repeat('A', 99));

-- Select and order by id
SELECT * FROM text_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM text_upper_bound_even;


