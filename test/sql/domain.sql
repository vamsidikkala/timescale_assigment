-- Test Domain data type
-- For domain datatype we are not checking the subtype for calculating the 
-- mean of n/2 and (n/2)+1 elements when result set contains even number of 
-- elements. Instead we return n/2 element as median.

DROP TABLE IF EXISTS domain_table_odd;
DROP TABLE IF EXISTS domain_table_even;
DROP DOMAIN IF EXISTS positive_int_domain;

CREATE DOMAIN positive_int_domain AS INTEGER
    CHECK (VALUE > 0);

CREATE TABLE domain_table_odd (
    id SERIAL PRIMARY KEY,
    value_column positive_int_domain
);

INSERT INTO domain_table_odd (value_column) VALUES
(1),
(3),
(5);

SELECT * FROM domain_table_odd ORDER BY id;

SELECT median(value_column) FROM domain_table_odd;


CREATE TABLE domain_table_even (
    id SERIAL PRIMARY KEY,
    value_column positive_int_domain
);

INSERT INTO domain_table_even (value_column) VALUES
(2),
(4),
(6),
(8);

SELECT * FROM domain_table_even ORDER BY id;

SELECT median(value_column) FROM domain_table_even;

