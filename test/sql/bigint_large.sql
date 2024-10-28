-- Test bigint data type with huge data

DROP TABLE IF EXISTS bigint_large_data;

CREATE TABLE bigint_large_data (
    id BIGINT
);

DO $$
DECLARE
    i BIGINT := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO bigint_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM bigint_large_data;

SELECT median(id) FROM bigint_large_data;


