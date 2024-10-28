-- Test BOOLEAN data type

DROP TABLE IF EXISTS boolean_table_odd;
DROP TABLE IF EXISTS boolean_table_even;

CREATE TABLE boolean_table_odd (id boolean);
CREATE TABLE boolean_table_even (id boolean);

INSERT INTO boolean_table_odd VALUES (TRUE);
INSERT INTO boolean_table_odd VALUES (FALSE);
INSERT INTO boolean_table_odd VALUES (TRUE);
INSERT INTO boolean_table_odd VALUES (FALSE);
INSERT INTO boolean_table_odd VALUES (TRUE);

INSERT INTO boolean_table_even VALUES (TRUE);
INSERT INTO boolean_table_even VALUES (FALSE);
INSERT INTO boolean_table_even VALUES (TRUE);
INSERT INTO boolean_table_even VALUES (FALSE);

SELECT * FROM boolean_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM boolean_table_odd;

SELECT * FROM boolean_table_even ORDER BY id;
SELECT median(id) AS median_value FROM boolean_table_even;

