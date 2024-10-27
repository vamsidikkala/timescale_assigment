-- ENUM Data Type in PostgreSQL

-- 1. Define the ENUM type
DROP TYPE IF EXISTS mood_type;

CREATE TYPE mood_type AS ENUM ('happy', 'sad', 'neutral');

-- 2. ENUM table
DROP TABLE IF EXISTS enum_table_odd;
DROP TABLE IF EXISTS enum_table_even;

CREATE TABLE enum_table_odd (id mood_type);
CREATE TABLE enum_table_even (id mood_type);

-- Insert 5 values into the odd table
INSERT INTO enum_table_odd VALUES ('happy');
INSERT INTO enum_table_odd VALUES ('sad');
INSERT INTO enum_table_odd VALUES ('neutral');
INSERT INTO enum_table_odd VALUES ('happy');
INSERT INTO enum_table_odd VALUES ('sad');

-- Insert 4 values into the even table
INSERT INTO enum_table_even VALUES ('happy');
INSERT INTO enum_table_even VALUES ('neutral');
INSERT INTO enum_table_even VALUES ('sad');
INSERT INTO enum_table_even VALUES ('happy');

-- Order by statement
SELECT * FROM enum_table_odd ORDER BY id;
SELECT * FROM enum_table_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM enum_table_odd;
SELECT median(id) AS median_value FROM enum_table_even;


