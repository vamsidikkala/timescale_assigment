-- Test bigserial data type with huge data

DROP TABLE IF EXISTS bigserial_large_data;

CREATE TABLE bigserial_large_data (
    id BIGINT
);

DO $$
DECLARE
    i BIGINT := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO bigserial_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM bigserial_large_data;

SELECT median(id) FROM bigserial_large_data;


