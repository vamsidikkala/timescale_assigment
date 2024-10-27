-- money
DROP TABLE IF EXISTS money_mean;
CREATE TABLE money_mean (
    id MONEY PRIMARY KEY
);
INSERT INTO money_mean (id) VALUES 
    ('1234.56'),                        -- Random value
    ('922337203685477.5807'::money - '10.00'::money),  -- Maximum value - 10
    ('922337203685477.5807'::money - '5.00'::money),   -- Maximum value - 5
    ('922337203685477.5807');           -- Maximum value
SELECT * FROM money_mean ORDER BY id;
SELECT median(id) FROM money_mean;


