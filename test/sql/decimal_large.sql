-- decimal
DROP TABLE IF EXISTS decimal_large_data;

CREATE TABLE decimal_large_data (
    id DECIMAL(10, 2)
);

DO $$
DECLARE
    i DECIMAL := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO decimal_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM decimal_large_data;

SELECT median(id) FROM decimal_large_data;

