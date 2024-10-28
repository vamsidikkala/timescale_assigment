-- Test lsn data type

DROP TABLE IF EXISTS lsn_table_odd;
DROP TABLE IF EXISTS lsn_table_even;

CREATE TABLE lsn_table_odd (
    id SERIAL PRIMARY KEY,
    value_column pg_lsn
);

INSERT INTO lsn_table_odd (value_column) VALUES
(pg_lsn('0/16B6D70')),
(pg_lsn('0/16B6D71')),
(pg_lsn('0/16B6D72'));

SELECT * FROM lsn_table_odd ORDER BY id;

SELECT median(value_column) FROM lsn_table_odd;

CREATE TABLE lsn_table_even (
    id SERIAL PRIMARY KEY,
    value_column pg_lsn
);

INSERT INTO lsn_table_even (value_column) VALUES
(pg_lsn('0/16B6D73')),
(pg_lsn('0/16B6D74')),
(pg_lsn('0/16B6D75')),
(pg_lsn('0/16B6D76'));

SELECT * FROM lsn_table_even ORDER BY id;

SELECT median(value_column) FROM lsn_table_even;

