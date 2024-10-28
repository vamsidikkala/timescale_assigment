-- integer with large data, test to veriify whether exteranl sorting kicks-in
-- or not.

DROP TABLE IF EXISTS integer_large_data;

CREATE TABLE integer_large_data (
    id INTEGER
);

DO $$
DECLARE
    i INTEGER := 1;
BEGIN
    FOR i IN 1..1500000 LOOP
        INSERT INTO integer_large_data(id) VALUES (i);
    END LOOP;
END $$;

SELECT COUNT(id) FROM integer_large_data;

SELECT median(id) FROM integer_large_data;


