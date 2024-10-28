-- Drop tables if they exist
DROP TABLE IF EXISTS oid_table_odd;
DROP TABLE IF EXISTS oid_table_even;

-- Create tables for odd and even row counts using the oid data type
CREATE TABLE oid_table_odd (
    id SERIAL PRIMARY KEY,
    value_column oid
);

-- Insert odd number of rows into oid_table_odd
INSERT INTO oid_table_odd (value_column) VALUES
(1001),
(1002),
(1003);  -- Continue to add odd number of rows

-- Select data ordered by id for oid_table_odd
SELECT * FROM oid_table_odd ORDER BY id;

-- Calculate the median for oid_table_odd
SELECT median(value_column) FROM oid_table_odd;


CREATE TABLE oid_table_even (
    id SERIAL PRIMARY KEY,
    value_column oid
);


-- Insert even number of rows into oid_table_even
INSERT INTO oid_table_even (value_column) VALUES
(1004),
(1005),
(1006),
(1007);  -- Continue to add even number of rows

-- Select data ordered by id for oid_table_even
SELECT * FROM oid_table_even ORDER BY id;

-- Calculate the median for oid_table_even
SELECT median(value_column) FROM oid_table_even;


