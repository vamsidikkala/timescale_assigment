-- Test int4range data type 

DROP TABLE IF EXISTS int4range_table_odd;
DROP TABLE IF EXISTS int4range_table_even;

CREATE TABLE int4range_table_odd (
    id SERIAL PRIMARY KEY,
    value_column int4range
);

INSERT INTO int4range_table_odd (value_column) VALUES
(int4range(1, 5)),
(int4range(6, 10)),
(int4range(11, 15)); 

SELECT * FROM int4range_table_odd ORDER BY id;

SELECT median(value_column) FROM int4range_table_odd;


CREATE TABLE int4range_table_even (
    id SERIAL PRIMARY KEY,
    value_column int4range
);

INSERT INTO int4range_table_even (value_column) VALUES
(int4range(16, 20)),
(int4range(21, 25)),
(int4range(26, 30)),
(int4range(31, 35)); 

SELECT * FROM int4range_table_even ORDER BY id;

SELECT median(value_column) FROM int4range_table_even;


