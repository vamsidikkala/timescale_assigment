-- Test large date with numeric datatype (1.5 million rows)

DROP TABLE IF EXISTS numeric_large_data;

CREATE TABLE numeric_large_data (
    id NUMERIC(15, 5)
);

DO $$
DECLARE
    i NUMERIC := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO numeric_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM numeric_large_data;

SELECT median(id) FROM numeric_large_data;


