
-- Test case to verify large data set of serial data type
DROP TABLE IF EXISTS serial_large_data;

CREATE TABLE serial_large_data (
    id INTEGER
);

DO $$
DECLARE
    i INTEGER := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO serial_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM serial_large_data;

SELECT median(id) FROM serial_large_data;


