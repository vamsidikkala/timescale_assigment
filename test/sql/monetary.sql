-- Monetary Data Type Example in PostgreSQL

-- Drop tables if they exist
DROP TABLE IF EXISTS money_table_odd;
DROP TABLE IF EXISTS money_table_even;

-- Create tables with the money data type
CREATE TABLE money_table_odd (id money);
CREATE TABLE money_table_even (id money);

-- Insert 5 values into the odd table
INSERT INTO money_table_odd VALUES ('$1.00');
INSERT INTO money_table_odd VALUES ('$3.00');
INSERT INTO money_table_odd VALUES ('$5.00');
INSERT INTO money_table_odd VALUES ('$7.00');
INSERT INTO money_table_odd VALUES ('$9.00');

-- Insert 4 values into the even table with sum of any two elements not divisible by 2
INSERT INTO money_table_even VALUES ('$2.00');
INSERT INTO money_table_even VALUES ('$4.00');
INSERT INTO money_table_even VALUES ('$5.00');  -- Ensures no sum is divisible by 2
INSERT INTO money_table_even VALUES ('$11.00');  -- Ensures no sum is divisible by 2

SELECT id from money_table_odd order by id;
SELECT median(id) AS median_value FROM money_table_odd;

SELECT id from money_table_even order by id;
SELECT median(id) AS median_value FROM money_table_even;

