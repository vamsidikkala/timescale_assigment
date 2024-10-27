-- real
DROP TABLE IF EXISTS real_large_data;

CREATE TABLE real_large_data (
    id REAL
);

DO $$
DECLARE
    i REAL := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO real_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM real_large_data;

SELECT median(id) FROM real_large_data;


