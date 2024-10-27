-- Monetary Data Types in PostgreSQL

-- 1. Money Lower Bound Table
DROP TABLE IF EXISTS money_lower_bound_even;
CREATE TABLE money_lower_bound_even (id MONEY);

-- Insert 4 rows with the lowest possible MONEY value
INSERT INTO money_lower_bound_even VALUES 
    ('-92233720368547758.08'), 
    ('-92233720368547758.08'), 
    ('-92233720368547758.08'), 
    ('-92233720368547758.08');

-- Select and order by id
SELECT * FROM money_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM money_lower_bound_even;

-- 2. Money Upper Bound Table
DROP TABLE IF EXISTS money_upper_bound_even;
CREATE TABLE money_upper_bound_even (id MONEY);

-- Insert 4 rows with the highest possible MONEY value
INSERT INTO money_upper_bound_even VALUES 
    ('92233720368547758.07'), 
    ('92233720368547758.07'), 
    ('92233720368547758.07'), 
    ('92233720368547758.07');

-- Select and order by id
SELECT * FROM money_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM money_upper_bound_even;


