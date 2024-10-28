-- Test INTERVAL, DATE, TIME, TIMESTAMP data types when result set contains
-- even number of elements and different elements present at n/2 and n/2 + 1
-- position. Database has to calculate the mean and send the calcuated mean
-- to the client as result.

-- timestamp without time zone

DROP TABLE IF EXISTS timestamp_without_tz_mean;
CREATE TABLE timestamp_without_tz_mean (
    id TIMESTAMP WITHOUT TIME ZONE PRIMARY KEY
);
INSERT INTO timestamp_without_tz_mean (id) VALUES 
    ('2023-10-27 14:30:00'),
    ('2038-01-19 03:14:07'::timestamp - INTERVAL '10 seconds'),  
    ('2038-01-19 03:14:07'::timestamp - INTERVAL '5 seconds'),   
    ('2038-01-19 03:14:07');                
SELECT * FROM timestamp_without_tz_mean ORDER BY id;
SELECT median(id) FROM timestamp_without_tz_mean;

-- timestamp with time zone
DROP TABLE IF EXISTS timestamp_with_tz_mean;
CREATE TABLE timestamp_with_tz_mean (
    id TIMESTAMP WITH TIME ZONE PRIMARY KEY
);
INSERT INTO timestamp_with_tz_mean (id) VALUES 
    ('2023-10-27 14:30:00-05'), 
    ('2038-01-19 03:14:07-05'::timestamp - INTERVAL '10 seconds'),   
    ('2038-01-19 03:14:07-05'::timestamp - INTERVAL '5 seconds'),    
    ('2038-01-19 03:14:07-05');
SELECT * FROM timestamp_with_tz_mean ORDER BY id;
SELECT median(id) FROM timestamp_with_tz_mean;

-- date
DROP TABLE IF EXISTS date_mean;
CREATE TABLE date_mean (
    id DATE PRIMARY KEY
);
INSERT INTO date_mean (id) VALUES 
    ('2023-10-15'),    
    ('2023-10-10'),
    ('2023-10-20'),
    ('2023-10-24');

SELECT * FROM date_mean ORDER BY id;
SELECT median(id) FROM date_mean;

-- time without time zone
DROP TABLE IF EXISTS time_without_tz_mean;
CREATE TABLE time_without_tz_mean (
    id TIME WITHOUT TIME ZONE PRIMARY KEY
);
INSERT INTO time_without_tz_mean (id) VALUES 
    ('14:30:00'),                
    ('23:59:59'::time - INTERVAL '10 seconds'),  
    ('23:59:59'::time - INTERVAL '5 seconds'),    
    ('23:59:59');              
SELECT * FROM time_without_tz_mean ORDER BY id;
SELECT median(id) FROM time_without_tz_mean;

-- time with time zone
DROP TABLE IF EXISTS time_with_tz_mean;
CREATE TABLE time_with_tz_mean (
    id TIME WITH TIME ZONE PRIMARY KEY
);
INSERT INTO time_with_tz_mean (id) VALUES 
    ('14:30:00-05'),
    ('23:59:59-05'::time - INTERVAL '10 seconds'), 
    ('23:59:59-05'::time - INTERVAL '5 seconds'), 
    ('23:59:59-05'); 
SELECT * FROM time_with_tz_mean ORDER BY id;
SELECT median(id) FROM time_with_tz_mean;

-- interval
DROP TABLE IF EXISTS interval_mean;
CREATE TABLE interval_mean (
    id INTERVAL PRIMARY KEY
);
INSERT INTO interval_mean (id) VALUES 
    ('1 day'),
    ('2147483647 days'::interval - INTERVAL '10 microseconds'),
    ('2147483647 days'::interval - INTERVAL '5 microseconds'),
    ('2147483647 days'); 
SELECT * FROM interval_mean ORDER BY id;
SELECT median(id) FROM interval_mean;


