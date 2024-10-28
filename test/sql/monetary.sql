-- test monetary data type

DROP TABLE IF EXISTS money_table_odd;
DROP TABLE IF EXISTS money_table_even;

CREATE TABLE money_table_odd (id money);
CREATE TABLE money_table_even (id money);

INSERT INTO money_table_odd VALUES ('$1.00');
INSERT INTO money_table_odd VALUES ('$3.00');
INSERT INTO money_table_odd VALUES ('$5.00');
INSERT INTO money_table_odd VALUES ('$7.00');
INSERT INTO money_table_odd VALUES ('$9.00');

INSERT INTO money_table_even VALUES ('$2.00');
INSERT INTO money_table_even VALUES ('$4.00');
INSERT INTO money_table_even VALUES ('$5.00');
INSERT INTO money_table_even VALUES ('$11.00');

SELECT id from money_table_odd order by id;
SELECT median(id) AS median_value FROM money_table_odd;

SELECT id from money_table_even order by id;
SELECT median(id) AS median_value FROM money_table_even;

