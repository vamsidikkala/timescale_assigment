-- Timestamp and Time-Related Data Types in PostgreSQL

-- 1. TIMESTAMP WITHOUT TIME ZONE Lower Bound Table
DROP TABLE IF EXISTS timestamp_without_timezone_lower_bound_even;
CREATE TABLE timestamp_without_timezone_lower_bound_even (id TIMESTAMP WITHOUT TIME ZONE);

-- Insert 4 rows with the lowest possible TIMESTAMP WITHOUT TIME ZONE value
INSERT INTO timestamp_without_timezone_lower_bound_even VALUES 
    ('4713-01-01 BC'), ('4713-01-01 BC'), ('4713-01-01 BC'), ('4713-01-01 BC');

-- Select and order by id
SELECT * FROM timestamp_without_timezone_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM timestamp_without_timezone_lower_bound_even;

-- 2. TIMESTAMP WITHOUT TIME ZONE Upper Bound Table
DROP TABLE IF EXISTS timestamp_without_timezone_upper_bound_even;
CREATE TABLE timestamp_without_timezone_upper_bound_even (id TIMESTAMP WITHOUT TIME ZONE);

-- Insert 4 rows with the highest possible TIMESTAMP WITHOUT TIME ZONE value
INSERT INTO timestamp_without_timezone_upper_bound_even VALUES 
    ('294276-12-31 AD'), ('294276-12-31 AD'), ('294276-12-31 AD'), ('294276-12-31 AD');

-- Select and order by id
SELECT * FROM timestamp_without_timezone_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM timestamp_without_timezone_upper_bound_even;

-- 3. TIMESTAMP WITH TIME ZONE Lower Bound Table
DROP TABLE IF EXISTS timestamp_with_timezone_lower_bound_even;
CREATE TABLE timestamp_with_timezone_lower_bound_even (id TIMESTAMP WITH TIME ZONE);

-- Insert 4 rows with the lowest possible TIMESTAMP WITH TIME ZONE value
INSERT INTO timestamp_with_timezone_lower_bound_even VALUES 
    ('4713-01-01 BC 00:00:00+00'), ('4713-01-01 BC 00:00:00+00'), ('4713-01-01 BC 00:00:00+00'), ('4713-01-01 BC 00:00:00+00');

-- Select and order by id
SELECT * FROM timestamp_with_timezone_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM timestamp_with_timezone_lower_bound_even;

-- 4. TIMESTAMP WITH TIME ZONE Upper Bound Table
DROP TABLE IF EXISTS timestamp_with_timezone_upper_bound_even;
CREATE TABLE timestamp_with_timezone_upper_bound_even (id TIMESTAMP WITH TIME ZONE);

-- Insert 4 rows with the highest possible TIMESTAMP WITH TIME ZONE value
INSERT INTO timestamp_with_timezone_upper_bound_even VALUES 
    ('294276-12-31 AD 23:59:59+00'), ('294276-12-31 AD 23:59:59+00'), ('294276-12-31 AD 23:59:59+00'), ('294276-12-31 AD 23:59:59+00');

-- Select and order by id
SELECT * FROM timestamp_with_timezone_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM timestamp_with_timezone_upper_bound_even;

-- 5. DATE Lower Bound Table
DROP TABLE IF EXISTS date_lower_bound_even;
CREATE TABLE date_lower_bound_even (id DATE);

-- Insert 4 rows with the lowest possible DATE value
INSERT INTO date_lower_bound_even VALUES 
    ('4713-01-01 BC'), ('4713-01-01 BC'), ('4713-01-01 BC'), ('4713-01-01 BC');

-- Select and order by id
SELECT * FROM date_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM date_lower_bound_even;

-- 6. DATE Upper Bound Table
DROP TABLE IF EXISTS date_upper_bound_even;
CREATE TABLE date_upper_bound_even (id DATE);

-- Insert 4 rows with the highest possible DATE value
INSERT INTO date_upper_bound_even VALUES 
    ('5874897-12-31'), ('5874897-12-31'), ('5874897-12-31'), ('5874897-12-31');

-- Select and order by id
SELECT * FROM date_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM date_upper_bound_even;

-- 7. TIME WITHOUT TIME ZONE Lower Bound Table
DROP TABLE IF EXISTS time_without_timezone_lower_bound_even;
CREATE TABLE time_without_timezone_lower_bound_even (id TIME WITHOUT TIME ZONE);

-- Insert 4 rows with the lowest possible TIME WITHOUT TIME ZONE value
INSERT INTO time_without_timezone_lower_bound_even VALUES 
    ('00:00:00'), ('00:00:00'), ('00:00:00'), ('00:00:00');

-- Select and order by id
SELECT * FROM time_without_timezone_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM time_without_timezone_lower_bound_even;

-- 8. TIME WITHOUT TIME ZONE Upper Bound Table
DROP TABLE IF EXISTS time_without_timezone_upper_bound_even;
CREATE TABLE time_without_timezone_upper_bound_even (id TIME WITHOUT TIME ZONE);

-- Insert 4 rows with the highest possible TIME WITHOUT TIME ZONE value
INSERT INTO time_without_timezone_upper_bound_even VALUES 
    ('24:00:00'), ('24:00:00'), ('24:00:00'), ('24:00:00');

-- Select and order by id
SELECT * FROM time_without_timezone_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM time_without_timezone_upper_bound_even;

-- 9. TIME WITH TIME ZONE Lower Bound Table
DROP TABLE IF EXISTS time_with_timezone_lower_bound_even;
CREATE TABLE time_with_timezone_lower_bound_even (id TIME WITH TIME ZONE);

-- Insert 4 rows with the lowest possible TIME WITH TIME ZONE value
INSERT INTO time_with_timezone_lower_bound_even VALUES 
    ('00:00:00-15:59'), ('00:00:00-15:59'), ('00:00:00-15:59'), ('00:00:00-15:59');

-- Select and order by id
SELECT * FROM time_with_timezone_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM time_with_timezone_lower_bound_even;

-- 10. TIME WITH TIME ZONE Upper Bound Table
DROP TABLE IF EXISTS time_with_timezone_upper_bound_even;
CREATE TABLE time_with_timezone_upper_bound_even (id TIME WITH TIME ZONE);

-- Insert 4 rows with the highest possible TIME WITH TIME ZONE value
INSERT INTO time_with_timezone_upper_bound_even VALUES 
    ('24:00:00+15:59'), ('24:00:00+15:59'), ('24:00:00+15:59'), ('24:00:00+15:59');

-- Select and order by id
SELECT * FROM time_with_timezone_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM time_with_timezone_upper_bound_even;

-- 11. INTERVAL Lower Bound Table
DROP TABLE IF EXISTS interval_lower_bound_even;
CREATE TABLE interval_lower_bound_even (id INTERVAL);

-- Insert 4 rows with the lowest possible INTERVAL value
INSERT INTO interval_lower_bound_even VALUES 
    ('-178000000 years'), ('-178000000 years'), ('-178000000 years'), ('-178000000 years');

-- Select and order by id
SELECT * FROM interval_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM interval_lower_bound_even;

-- 12. INTERVAL Upper Bound Table
DROP TABLE IF EXISTS interval_upper_bound_even;
CREATE TABLE interval_upper_bound_even (id INTERVAL);

-- Insert 4 rows with the highest possible INTERVAL value
INSERT INTO interval_upper_bound_even VALUES 
    ('178000000 years'), ('178000000 years'), ('178000000 years'), ('178000000 years');

-- Select and order by id
SELECT * FROM interval_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM interval_upper_bound_even;


