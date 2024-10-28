--Test case for querying NULL result-set

DROP TABLE IF EXISTS numeric_table_odd;
DROP TABLE IF EXISTS numeric_table_even;

CREATE TABLE numeric_table_odd (
    id SERIAL PRIMARY KEY,
    int_column INTEGER,
    float_column FLOAT,
    numeric_column NUMERIC
);


INSERT INTO numeric_table_odd (int_column, float_column, numeric_column) VALUES
(NULL, NULL, NULL),
(NULL, NULL, NULL),
(NULL, NULL, NULL);

SELECT * FROM numeric_table_odd ORDER BY id;

SELECT median(int_column) FROM numeric_table_odd; 
SELECT median(float_column) FROM numeric_table_odd; 
SELECT median(numeric_column) FROM numeric_table_odd;

CREATE TABLE numeric_table_even (
    id SERIAL PRIMARY KEY,
    int_column INTEGER,
    float_column FLOAT,
    numeric_column NUMERIC
);

INSERT INTO numeric_table_even (int_column, float_column, numeric_column) VALUES
(NULL, NULL, NULL),
(NULL, NULL, NULL),
(NULL, NULL, NULL),
(NULL, NULL, NULL);

SELECT * FROM numeric_table_even ORDER BY id;

SELECT median(int_column) FROM numeric_table_even;  
SELECT median(float_column) FROM numeric_table_even; 
SELECT median(numeric_column) FROM numeric_table_even; 


