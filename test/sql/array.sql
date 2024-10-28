-- ARRAY data type 

DROP TABLE IF EXISTS array_table_odd;
DROP TABLE IF EXISTS array_table_even;

CREATE TABLE array_table_odd (id INT[]);
CREATE TABLE array_table_even (id INT[]);

INSERT INTO array_table_odd VALUES (ARRAY[1, 2, 3]);
INSERT INTO array_table_odd VALUES (ARRAY[4, 5, 6]);
INSERT INTO array_table_odd VALUES (ARRAY[7, 8, 9]);
INSERT INTO array_table_odd VALUES (ARRAY[10, 11, 12]);
INSERT INTO array_table_odd VALUES (ARRAY[13, 14, 15]);

INSERT INTO array_table_even VALUES (ARRAY[16, 17, 18, 19]);
INSERT INTO array_table_even VALUES (ARRAY[20, 21, 22, 23]);
INSERT INTO array_table_even VALUES (ARRAY[24, 25, 26, 27]);
INSERT INTO array_table_even VALUES (ARRAY[28, 29, 30, 31]);

SELECT * FROM array_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM array_table_odd;


SELECT * FROM array_table_even ORDER BY id;

SELECT median(id) AS median_value FROM array_table_even;

