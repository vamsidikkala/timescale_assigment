-- Test case to very empty result-set return value

DROP TABLE IF EXISTS numeric_table_odd;
DROP TABLE IF EXISTS numeric_table_even;

CREATE TABLE numeric_table_odd (
    id SERIAL PRIMARY KEY,
    int_column INTEGER,
    float_column FLOAT,
    numeric_column NUMERIC
);

CREATE TABLE numeric_table_even (
    id SERIAL PRIMARY KEY,
    int_column INTEGER,
    float_column FLOAT,
    numeric_column NUMERIC
);

SELECT * FROM numeric_table_odd ORDER BY id;

SELECT * FROM numeric_table_even ORDER BY id;

SELECT median(int_column) FROM numeric_table_odd;  
SELECT median(float_column) FROM numeric_table_odd; 
SELECT median(numeric_column) FROM numeric_table_odd; 

SELECT median(int_column) FROM numeric_table_even;  
SELECT median(float_column) FROM numeric_table_even; 
SELECT median(numeric_column) FROM numeric_table_even; 


