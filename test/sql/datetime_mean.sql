-- timestamp without time zone
DROP TABLE IF EXISTS timestamp_without_tz_mean;
CREATE TABLE timestamp_without_tz_mean (
    id TIMESTAMP WITHOUT TIME ZONE PRIMARY KEY
);
INSERT INTO timestamp_without_tz_mean (id) VALUES 
    ('2023-10-27 14:30:00'),               -- Random value
    ('2038-01-19 03:14:07'::timestamp - INTERVAL '10 seconds'),  -- Maximum value - 10
    ('2038-01-19 03:14:07'::timestamp - INTERVAL '5 seconds'),   -- Maximum value - 5
    ('2038-01-19 03:14:07');                -- Maximum value
SELECT * FROM timestamp_without_tz_mean ORDER BY id;
SELECT median(id) FROM timestamp_without_tz_mean;

-- timestamp with time zone
DROP TABLE IF EXISTS timestamp_with_tz_mean;
CREATE TABLE timestamp_with_tz_mean (
    id TIMESTAMP WITH TIME ZONE PRIMARY KEY
);
INSERT INTO timestamp_with_tz_mean (id) VALUES 
    ('2023-10-27 14:30:00-05'),             -- Random value
    ('2038-01-19 03:14:07-05'::timestamp - INTERVAL '10 seconds'),   -- Maximum value - 10
    ('2038-01-19 03:14:07-05'::timestamp - INTERVAL '5 seconds'),    -- Maximum value - 5
    ('2038-01-19 03:14:07-05');              -- Maximum value
SELECT * FROM timestamp_with_tz_mean ORDER BY id;
SELECT median(id) FROM timestamp_with_tz_mean;

-- date
DROP TABLE IF EXISTS date_mean;
CREATE TABLE date_mean (
    id DATE PRIMARY KEY
);
INSERT INTO date_mean (id) VALUES 
    ('2023-10-15'),                -- Random value
    ('2023-10-10'),                -- Random value
    ('2023-10-20'),                -- Random value
    ('2023-10-24');                -- Random value
SELECT * FROM date_mean ORDER BY id;
SELECT median(id) FROM date_mean;

-- time without time zone
DROP TABLE IF EXISTS time_without_tz_mean;
CREATE TABLE time_without_tz_mean (
    id TIME WITHOUT TIME ZONE PRIMARY KEY
);
INSERT INTO time_without_tz_mean (id) VALUES 
    ('14:30:00'),                -- Random value
    ('23:59:59'::time - INTERVAL '10 seconds'),  -- Maximum value - 10
    ('23:59:59'::time - INTERVAL '5 seconds'),    -- Maximum value - 5
    ('23:59:59');                -- Maximum value
SELECT * FROM time_without_tz_mean ORDER BY id;
SELECT median(id) FROM time_without_tz_mean;

-- time with time zone
DROP TABLE IF EXISTS time_with_tz_mean;
CREATE TABLE time_with_tz_mean (
    id TIME WITH TIME ZONE PRIMARY KEY
);
INSERT INTO time_with_tz_mean (id) VALUES 
    ('14:30:00-05'),             -- Random value
    ('23:59:59-05'::time - INTERVAL '10 seconds'), -- Maximum value - 10
    ('23:59:59-05'::time - INTERVAL '5 seconds'),   -- Maximum value - 5
    ('23:59:59-05');             -- Maximum value
SELECT * FROM time_with_tz_mean ORDER BY id;
SELECT median(id) FROM time_with_tz_mean;

-- interval
DROP TABLE IF EXISTS interval_mean;
CREATE TABLE interval_mean (
    id INTERVAL PRIMARY KEY
);
INSERT INTO interval_mean (id) VALUES 
    ('1 day'),                    -- Random value
    ('2147483647 days'::interval - INTERVAL '10 microseconds'),  -- Maximum value - 10
    ('2147483647 days'::interval - INTERVAL '5 microseconds'),   -- Maximum value - 5
    ('2147483647 days');          -- Maximum value
SELECT * FROM interval_mean ORDER BY id;
SELECT median(id) FROM interval_mean;


