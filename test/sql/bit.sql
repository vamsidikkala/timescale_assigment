-- Test BIT and BIT VARYING data types

-- 1. BIT
DROP TABLE IF EXISTS bit_table_odd;
DROP TABLE IF EXISTS bit_table_even;

CREATE TABLE bit_table_odd (id BIT(3));
CREATE TABLE bit_table_even (id BIT(3));

INSERT INTO bit_table_odd VALUES (B'101');
INSERT INTO bit_table_odd VALUES (B'110');
INSERT INTO bit_table_odd VALUES (B'111');
INSERT INTO bit_table_odd VALUES (B'100');
INSERT INTO bit_table_odd VALUES (B'001');

INSERT INTO bit_table_even VALUES (B'101');
INSERT INTO bit_table_even VALUES (B'110');
INSERT INTO bit_table_even VALUES (B'001');
INSERT INTO bit_table_even VALUES (B'110');

SELECT * FROM bit_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM bit_table_odd;

SELECT * FROM bit_table_even ORDER BY id;

SELECT median(id) AS median_value FROM bit_table_even;

-- 2. BIT VARYING
DROP TABLE IF EXISTS bit_varying_table_odd;
DROP TABLE IF EXISTS bit_varying_table_even;

CREATE TABLE bit_varying_table_odd (id BIT VARYING);
CREATE TABLE bit_varying_table_even (id BIT VARYING);

INSERT INTO bit_varying_table_odd VALUES (B'10101');
INSERT INTO bit_varying_table_odd VALUES (B'11010');
INSERT INTO bit_varying_table_odd VALUES (B'11111');
INSERT INTO bit_varying_table_odd VALUES (B'10001');
INSERT INTO bit_varying_table_odd VALUES (B'00100');

INSERT INTO bit_varying_table_even VALUES (B'010101');
INSERT INTO bit_varying_table_even VALUES (B'110000');
INSERT INTO bit_varying_table_even VALUES (B'000101');
INSERT INTO bit_varying_table_even VALUES (B'111010');

SELECT * FROM bit_varying_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM bit_varying_table_odd;

SELECT * FROM bit_varying_table_even ORDER BY id;

SELECT median(id) AS median_value FROM bit_varying_table_even;

