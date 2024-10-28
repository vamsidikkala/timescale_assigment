-- Test double precision with large data 3 million rows
-- (3 * 10^ 6 ) * 8 bytes ~ 24 MB

DROP TABLE IF EXISTS double_precision_large_data;

CREATE TABLE double_precision_large_data (
    id DOUBLE PRECISION
);

DO $$
DECLARE
    i DOUBLE PRECISION := 1;
BEGIN
    FOR i IN 1..3000000 LOOP
        INSERT INTO double_precision_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM double_precision_large_data;

SELECT median(id) FROM double_precision_large_data;

