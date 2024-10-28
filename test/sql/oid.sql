--Test Oid data type

DROP TABLE IF EXISTS oid_table_odd;
DROP TABLE IF EXISTS oid_table_even;

CREATE TABLE oid_table_odd (
    id SERIAL PRIMARY KEY,
    value_column oid
);

INSERT INTO oid_table_odd (value_column) VALUES
(1001),
(1002),
(1003);

SELECT * FROM oid_table_odd ORDER BY id;

SELECT median(value_column) FROM oid_table_odd;


CREATE TABLE oid_table_even (
    id SERIAL PRIMARY KEY,
    value_column oid
);


INSERT INTO oid_table_even (value_column) VALUES
(1004),
(1005),
(1006),
(1007);

SELECT * FROM oid_table_even ORDER BY id;

SELECT median(value_column) FROM oid_table_even;


