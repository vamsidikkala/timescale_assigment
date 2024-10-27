-- BOOLEAN Data Type in PostgreSQL

-- 1. boolean
DROP TABLE IF EXISTS boolean_table_odd;
DROP TABLE IF EXISTS boolean_table_even;

CREATE TABLE boolean_table_odd (id boolean);
CREATE TABLE boolean_table_even (id boolean);

-- Insert 5 values into the odd table
INSERT INTO boolean_table_odd VALUES (TRUE);
INSERT INTO boolean_table_odd VALUES (FALSE);
INSERT INTO boolean_table_odd VALUES (TRUE);
INSERT INTO boolean_table_odd VALUES (FALSE);
INSERT INTO boolean_table_odd VALUES (TRUE);

-- Insert 4 values into the even table
INSERT INTO boolean_table_even VALUES (TRUE);
INSERT INTO boolean_table_even VALUES (FALSE);
INSERT INTO boolean_table_even VALUES (TRUE);
INSERT INTO boolean_table_even VALUES (FALSE);

SELECT * FROM boolean_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM boolean_table_odd;

SELECT * FROM boolean_table_even ORDER BY id;
SELECT median(id) AS median_value FROM boolean_table_even;

