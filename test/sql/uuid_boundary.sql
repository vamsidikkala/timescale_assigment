-- UUID Data Type in PostgreSQL

-- 1. UUID Lower Bound Table
DROP TABLE IF EXISTS uuid_lower_bound_even;
CREATE TABLE uuid_lower_bound_even (id UUID);

-- Insert 4 rows with a default lowest possible UUID value
INSERT INTO uuid_lower_bound_even VALUES 
    ('00000000-0000-0000-0000-000000000000'), 
    ('00000000-0000-0000-0000-000000000000'), 
    ('00000000-0000-0000-0000-000000000000'), 
    ('00000000-0000-0000-0000-000000000000');

-- Select and order by id
SELECT * FROM uuid_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM uuid_lower_bound_even;

-- 2. UUID Upper Bound Table
DROP TABLE IF EXISTS uuid_upper_bound_even;
CREATE TABLE uuid_upper_bound_even (id UUID);

-- Insert 4 rows with a default highest possible UUID value
INSERT INTO uuid_upper_bound_even VALUES 
    ('ffffffff-ffff-ffff-ffff-ffffffffffff'), 
    ('ffffffff-ffff-ffff-ffff-ffffffffffff'), 
    ('ffffffff-ffff-ffff-ffff-ffffffffffff'), 
    ('ffffffff-ffff-ffff-ffff-ffffffffffff');

-- Select and order by id
SELECT * FROM uuid_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM uuid_upper_bound_even;


