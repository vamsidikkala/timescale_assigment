-- TIMESTAMP Data Types in PostgreSQL

-- 1. timestamp without time zone
DROP TABLE IF EXISTS timestamp_without_tz_table_odd;
DROP TABLE IF EXISTS timestamp_without_tz_table_even;

CREATE TABLE timestamp_without_tz_table_odd (id timestamp without time zone);
CREATE TABLE timestamp_without_tz_table_even (id timestamp without time zone);

-- Insert 5 values into the odd table
INSERT INTO timestamp_without_tz_table_odd VALUES ('2024-10-26 10:00:00');
INSERT INTO timestamp_without_tz_table_odd VALUES ('2024-10-26 11:00:00');
INSERT INTO timestamp_without_tz_table_odd VALUES ('2024-10-26 12:00:00');
INSERT INTO timestamp_without_tz_table_odd VALUES ('2024-10-26 13:00:00');
INSERT INTO timestamp_without_tz_table_odd VALUES ('2024-10-26 14:00:00');

-- Insert 4 values into the even table
INSERT INTO timestamp_without_tz_table_even VALUES ('2024-10-26 15:00:00');
INSERT INTO timestamp_without_tz_table_even VALUES ('2024-10-26 16:00:00');
INSERT INTO timestamp_without_tz_table_even VALUES ('2024-10-26 17:00:00');
INSERT INTO timestamp_without_tz_table_even VALUES ('2024-10-26 18:00:00');

-- Order by statement
SELECT * FROM timestamp_without_tz_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM timestamp_without_tz_table_odd;

SELECT * FROM timestamp_without_tz_table_even ORDER BY id;

SELECT median(id) AS median_value FROM timestamp_without_tz_table_even;

-- 2. timestamp with time zone
DROP TABLE IF EXISTS timestamp_with_tz_table_odd;
DROP TABLE IF EXISTS timestamp_with_tz_table_even;

CREATE TABLE timestamp_with_tz_table_odd (id timestamp with time zone);
CREATE TABLE timestamp_with_tz_table_even (id timestamp with time zone);

-- Insert 5 values into the odd table
INSERT INTO timestamp_with_tz_table_odd VALUES ('2024-10-26 10:00:00+00');
INSERT INTO timestamp_with_tz_table_odd VALUES ('2024-10-26 11:00:00+00');
INSERT INTO timestamp_with_tz_table_odd VALUES ('2024-10-26 12:00:00+00');
INSERT INTO timestamp_with_tz_table_odd VALUES ('2024-10-26 13:00:00+00');
INSERT INTO timestamp_with_tz_table_odd VALUES ('2024-10-26 14:00:00+00');

-- Insert 4 values into the even table
INSERT INTO timestamp_with_tz_table_even VALUES ('2024-10-26 15:00:00+00');
INSERT INTO timestamp_with_tz_table_even VALUES ('2024-10-26 16:00:00+00');
INSERT INTO timestamp_with_tz_table_even VALUES ('2024-10-26 17:00:00+00');
INSERT INTO timestamp_with_tz_table_even VALUES ('2024-10-26 18:00:00+00');

-- Order by statement
SELECT * FROM timestamp_with_tz_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM timestamp_with_tz_table_odd;

SELECT * FROM timestamp_with_tz_table_even ORDER BY id;

SELECT median(id) AS median_value FROM timestamp_with_tz_table_even;

-- 3. date
DROP TABLE IF EXISTS date_table_odd;
DROP TABLE IF EXISTS date_table_even;

CREATE TABLE date_table_odd (id date);
CREATE TABLE date_table_even (id date);

-- Insert 5 values into the odd table
INSERT INTO date_table_odd VALUES ('2024-10-26');
INSERT INTO date_table_odd VALUES ('2024-10-27');
INSERT INTO date_table_odd VALUES ('2024-10-28');
INSERT INTO date_table_odd VALUES ('2024-10-29');
INSERT INTO date_table_odd VALUES ('2024-10-30');

-- Insert 4 values into the even table
INSERT INTO date_table_even VALUES ('2024-10-31');
INSERT INTO date_table_even VALUES ('2024-11-01');
INSERT INTO date_table_even VALUES ('2024-11-02');
INSERT INTO date_table_even VALUES ('2024-11-03');

-- Order by statement
SELECT * FROM date_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM date_table_odd;

SELECT * FROM date_table_even ORDER BY id;

SELECT median(id) AS median_value FROM date_table_even;

-- 4. time without time zone
DROP TABLE IF EXISTS time_without_tz_table_odd;
DROP TABLE IF EXISTS time_without_tz_table_even;

CREATE TABLE time_without_tz_table_odd (id time without time zone);
CREATE TABLE time_without_tz_table_even (id time without time zone);

-- Insert 5 values into the odd table
INSERT INTO time_without_tz_table_odd VALUES ('10:00:00');
INSERT INTO time_without_tz_table_odd VALUES ('11:00:00');
INSERT INTO time_without_tz_table_odd VALUES ('12:00:00');
INSERT INTO time_without_tz_table_odd VALUES ('13:00:00');
INSERT INTO time_without_tz_table_odd VALUES ('14:00:00');

-- Insert 4 values into the even table
INSERT INTO time_without_tz_table_even VALUES ('15:00:00');
INSERT INTO time_without_tz_table_even VALUES ('16:00:00');
INSERT INTO time_without_tz_table_even VALUES ('17:00:00');
INSERT INTO time_without_tz_table_even VALUES ('18:00:00');

-- Order by statement
SELECT * FROM time_without_tz_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM time_without_tz_table_odd;

SELECT * FROM time_without_tz_table_even ORDER BY id;

SELECT median(id) AS median_value FROM time_without_tz_table_even;

-- 5. time with time zone
DROP TABLE IF EXISTS time_with_tz_table_odd;
DROP TABLE IF EXISTS time_with_tz_table_even;

CREATE TABLE time_with_tz_table_odd (id time with time zone);
CREATE TABLE time_with_tz_table_even (id time with time zone);

-- Insert 5 values into the odd table
INSERT INTO time_with_tz_table_odd VALUES ('10:00:00+00');
INSERT INTO time_with_tz_table_odd VALUES ('11:00:00+00');
INSERT INTO time_with_tz_table_odd VALUES ('12:00:00+00');
INSERT INTO time_with_tz_table_odd VALUES ('13:00:00+00');
INSERT INTO time_with_tz_table_odd VALUES ('14:00:00+00');

-- Insert 4 values into the even table
INSERT INTO time_with_tz_table_even VALUES ('15:00:00+00');
INSERT INTO time_with_tz_table_even VALUES ('16:00:00+00');
INSERT INTO time_with_tz_table_even VALUES ('17:00:00+00');
INSERT INTO time_with_tz_table_even VALUES ('18:00:00+00');

-- Order by statement
SELECT * FROM time_with_tz_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM time_with_tz_table_odd;

SELECT * FROM time_with_tz_table_even ORDER BY id;

SELECT median(id) AS median_value FROM time_with_tz_table_even;

-- 6. interval
DROP TABLE IF EXISTS interval_table_odd;
DROP TABLE IF EXISTS interval_table_even;

CREATE TABLE interval_table_odd (id interval);
CREATE TABLE interval_table_even (id interval);

-- Insert 5 values into the odd table
INSERT INTO interval_table_odd VALUES ('1 day 2 hours');
INSERT INTO interval_table_odd VALUES ('2 days 3 hours');
INSERT INTO interval_table_odd VALUES ('3 days 4 hours');
INSERT INTO interval_table_odd VALUES ('4 days 5 hours');
INSERT INTO interval_table_odd VALUES ('5 days 6 hours');

-- Insert 4 values into the even table
INSERT INTO interval_table_even VALUES ('1 day 2 hours');
INSERT INTO interval_table_even VALUES ('2 days 3 hours');
INSERT INTO interval_table_even VALUES ('3 days 4 hours');
INSERT INTO interval_table_even VALUES ('4 days 5 hours');

-- Order by statement
SELECT * FROM interval_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM interval_table_odd;

SELECT * FROM interval_table_even ORDER BY id;

SELECT median(id) AS median_value FROM interval_table_even;


