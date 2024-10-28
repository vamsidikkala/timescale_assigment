-- Drop tables if they exist
DROP TABLE IF EXISTS lsn_table_odd;
DROP TABLE IF EXISTS lsn_table_even;

-- Create tables for odd and even row counts using the pg_lsn data type
CREATE TABLE lsn_table_odd (
    id SERIAL PRIMARY KEY,
    value_column pg_lsn
);

-- Insert odd number of rows into lsn_table_odd
INSERT INTO lsn_table_odd (value_column) VALUES
(pg_lsn('0/16B6D70')),
(pg_lsn('0/16B6D71')),
(pg_lsn('0/16B6D72'));  -- Continue to add odd number of rows

-- Select data ordered by id for lsn_table_odd
SELECT * FROM lsn_table_odd ORDER BY id;

-- Calculate the median for lsn_table_odd
SELECT median(value_column) FROM lsn_table_odd;

CREATE TABLE lsn_table_even (
    id SERIAL PRIMARY KEY,
    value_column pg_lsn
);

-- Insert even number of rows into lsn_table_even
INSERT INTO lsn_table_even (value_column) VALUES
(pg_lsn('0/16B6D73')),
(pg_lsn('0/16B6D74')),
(pg_lsn('0/16B6D75')),
(pg_lsn('0/16B6D76'));  -- Continue to add even number of rows

-- Calculate the median for lsn_table_even
SELECT median(value_column) FROM lsn_table_even;

-- Select data ordered by id for lsn_table_even
SELECT * FROM lsn_table_even ORDER BY id;


