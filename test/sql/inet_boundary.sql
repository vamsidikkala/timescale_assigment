-- Network and MAC Address Data Types in PostgreSQL

-- 1. CIDR Lower Bound Table
DROP TABLE IF EXISTS cidr_lower_bound_even;
CREATE TABLE cidr_lower_bound_even (id CIDR);

-- Insert 4 rows with the lowest possible CIDR value
INSERT INTO cidr_lower_bound_even VALUES 
    ('0.0.0.0/0'), ('0.0.0.0/0'), ('0.0.0.0/0'), ('0.0.0.0/0');

-- Select and order by id
SELECT * FROM cidr_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM cidr_lower_bound_even;

-- 2. CIDR Upper Bound Table
DROP TABLE IF EXISTS cidr_upper_bound_even;
CREATE TABLE cidr_upper_bound_even (id CIDR);

-- Insert 4 rows with the highest possible CIDR value
INSERT INTO cidr_upper_bound_even VALUES 
    ('255.255.255.255/32'), ('255.255.255.255/32'), ('255.255.255.255/32'), ('255.255.255.255/32');

-- Select and order by id
SELECT * FROM cidr_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM cidr_upper_bound_even;

-- 3. INET Lower Bound Table
DROP TABLE IF EXISTS inet_lower_bound_even;
CREATE TABLE inet_lower_bound_even (id INET);

-- Insert 4 rows with the lowest possible INET value
INSERT INTO inet_lower_bound_even VALUES 
    ('0.0.0.0/0'), ('0.0.0.0/0'), ('0.0.0.0/0'), ('0.0.0.0/0');

-- Select and order by id
SELECT * FROM inet_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM inet_lower_bound_even;

-- 4. INET Upper Bound Table
DROP TABLE IF EXISTS inet_upper_bound_even;
CREATE TABLE inet_upper_bound_even (id INET);

-- Insert 4 rows with the highest possible INET value
INSERT INTO inet_upper_bound_even VALUES 
    ('255.255.255.255/32'), ('255.255.255.255/32'), ('255.255.255.255/32'), ('255.255.255.255/32');

-- Select and order by id
SELECT * FROM inet_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM inet_upper_bound_even;

-- 5. MACADDR Lower Bound Table
DROP TABLE IF EXISTS macaddr_lower_bound_even;
CREATE TABLE macaddr_lower_bound_even (id MACADDR);

-- Insert 4 rows with the lowest possible MACADDR value
INSERT INTO macaddr_lower_bound_even VALUES 
    ('00:00:00:00:00:00'), ('00:00:00:00:00:00'), ('00:00:00:00:00:00'), ('00:00:00:00:00:00');

-- Select and order by id
SELECT * FROM macaddr_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM macaddr_lower_bound_even;

-- 6. MACADDR Upper Bound Table
DROP TABLE IF EXISTS macaddr_upper_bound_even;
CREATE TABLE macaddr_upper_bound_even (id MACADDR);

-- Insert 4 rows with the highest possible MACADDR value
INSERT INTO macaddr_upper_bound_even VALUES 
    ('FF:FF:FF:FF:FF:FF'), ('FF:FF:FF:FF:FF:FF'), ('FF:FF:FF:FF:FF:FF'), ('FF:FF:FF:FF:FF:FF');

-- Select and order by id
SELECT * FROM macaddr_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM macaddr_upper_bound_even;

-- 7. MACADDR8 Lower Bound Table
DROP TABLE IF EXISTS macaddr8_lower_bound_even;
CREATE TABLE macaddr8_lower_bound_even (id MACADDR8);

-- Insert 4 rows with the lowest possible MACADDR8 value
INSERT INTO macaddr8_lower_bound_even VALUES                                    
    ('00:00:00:00:00:00:00:00'), ('00:00:00:00:00:00:00:00'), 
    ('00:00:00:00:00:00:00:00'), ('00:00:00:00:00:00:00:00');


-- Select and order by id
SELECT * FROM macaddr8_lower_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM macaddr8_lower_bound_even;

-- 8. MACADDR8 Upper Bound Table
DROP TABLE IF EXISTS macaddr8_upper_bound_even;
CREATE TABLE macaddr8_upper_bound_even (id MACADDR8);

-- Insert 4 rows with the highest possible MACADDR8 value
INSERT INTO macaddr8_upper_bound_even VALUES 
    ('FF:FF:FF:FF:FF:FF:FF:FF'), ('FF:FF:FF:FF:FF:FF:FF:FF'), ('FF:FF:FF:FF:FF:FF:FF:FF'), ('FF:FF:FF:FF:FF:FF:FF:FF');

-- Select and order by id
SELECT * FROM macaddr8_upper_bound_even ORDER BY id;

-- Median calculation
SELECT median(id) AS median_value FROM macaddr8_upper_bound_even;


