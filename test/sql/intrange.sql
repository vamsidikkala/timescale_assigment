-- Drop tables if they exist
DROP TABLE IF EXISTS int4range_table_odd;
DROP TABLE IF EXISTS int4range_table_even;

-- Create tables for odd and even row counts using int4range data type
CREATE TABLE int4range_table_odd (
    id SERIAL PRIMARY KEY,
    value_column int4range
);

-- Insert odd number of rows into int4range_table_odd
INSERT INTO int4range_table_odd (value_column) VALUES
(int4range(1, 5)),
(int4range(6, 10)),
(int4range(11, 15)); 

-- Select data ordered by id for int4range_table_odd
SELECT * FROM int4range_table_odd ORDER BY id;

-- Calculate the median for int4range_table_odd
SELECT median(value_column) FROM int4range_table_odd;


CREATE TABLE int4range_table_even (
    id SERIAL PRIMARY KEY,
    value_column int4range
);

-- Insert even number of rows into int4range_table_even
INSERT INTO int4range_table_even (value_column) VALUES
(int4range(16, 20)),
(int4range(21, 25)),
(int4range(26, 30)),
(int4range(31, 35)); 

-- Select data ordered by id for int4range_table_even
SELECT * FROM int4range_table_even ORDER BY id;

-- Calculate the median for int4range_table_even
SELECT median(value_column) FROM int4range_table_even;


