-- Test ENUM data type

DROP TYPE IF EXISTS mood_type;

CREATE TYPE mood_type AS ENUM ('happy', 'sad', 'neutral');

DROP TABLE IF EXISTS enum_table_odd;
DROP TABLE IF EXISTS enum_table_even;

CREATE TABLE enum_table_odd (id mood_type);
CREATE TABLE enum_table_even (id mood_type);

INSERT INTO enum_table_odd VALUES ('happy');
INSERT INTO enum_table_odd VALUES ('sad');
INSERT INTO enum_table_odd VALUES ('neutral');
INSERT INTO enum_table_odd VALUES ('happy');
INSERT INTO enum_table_odd VALUES ('sad');

INSERT INTO enum_table_even VALUES ('happy');
INSERT INTO enum_table_even VALUES ('neutral');
INSERT INTO enum_table_even VALUES ('sad');
INSERT INTO enum_table_even VALUES ('happy');

SELECT * FROM enum_table_odd ORDER BY id;
SELECT * FROM enum_table_even ORDER BY id;

SELECT median(id) AS median_value FROM enum_table_odd;
SELECT median(id) AS median_value FROM enum_table_even;


