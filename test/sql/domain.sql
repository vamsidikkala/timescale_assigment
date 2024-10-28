-- Drop tables and domain if they exist
DROP TABLE IF EXISTS domain_table_odd;
DROP TABLE IF EXISTS domain_table_even;
DROP DOMAIN IF EXISTS positive_int_domain;

-- Create a domain for positive integers
CREATE DOMAIN positive_int_domain AS INTEGER
    CHECK (VALUE > 0);

-- Create tables for odd and even row counts using the positive_int_domain data type
CREATE TABLE domain_table_odd (
    id SERIAL PRIMARY KEY,
    value_column positive_int_domain
);

-- Insert odd number of rows into domain_table_odd
INSERT INTO domain_table_odd (value_column) VALUES
(1),
(3),
(5);

-- Select data ordered by id for domain_table_odd
SELECT * FROM domain_table_odd ORDER BY id;

-- Calculate the median for domain_table_odd
SELECT median(value_column) FROM domain_table_odd;


CREATE TABLE domain_table_even (
    id SERIAL PRIMARY KEY,
    value_column positive_int_domain
);

-- Insert even number of rows into domain_table_even
INSERT INTO domain_table_even (value_column) VALUES
(2),
(4),
(6),
(8);

-- Select data ordered by id for domain_table_even
SELECT * FROM domain_table_even ORDER BY id;

-- Calculate the median for domain_table_even
SELECT median(value_column) FROM domain_table_even;

