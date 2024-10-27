-- UUID Data Type in PostgreSQL

-- 1. UUID
DROP TABLE IF EXISTS uuid_table_odd;
DROP TABLE IF EXISTS uuid_table_even;

CREATE TABLE uuid_table_odd (id UUID);
CREATE TABLE uuid_table_even (id UUID);

-- Insert 5 values into the odd table using default UUID values
INSERT INTO uuid_table_odd VALUES ('123e4567-e89b-12d3-a456-426614174000');
INSERT INTO uuid_table_odd VALUES ('123e4567-e89b-12d3-a456-426614174001');
INSERT INTO uuid_table_odd VALUES ('123e4567-e89b-12d3-a456-426614174002');
INSERT INTO uuid_table_odd VALUES ('123e4567-e89b-12d3-a456-426614174003');
INSERT INTO uuid_table_odd VALUES ('123e4567-e89b-12d3-a456-426614174004');

-- Insert 4 values into the even table using default UUID values
INSERT INTO uuid_table_even VALUES ('123e4567-e89b-12d3-a456-426614174005');
INSERT INTO uuid_table_even VALUES ('123e4567-e89b-12d3-a456-426614174006');
INSERT INTO uuid_table_even VALUES ('123e4567-e89b-12d3-a456-426614174007');
INSERT INTO uuid_table_even VALUES ('123e4567-e89b-12d3-a456-426614174008');

-- Order by statement
SELECT * FROM uuid_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM uuid_table_odd;

SELECT * FROM uuid_table_even ORDER BY id;

SELECT median(id) AS median_value FROM uuid_table_even;

