-- test sort collation. Each language has different set of rules for sorting 
--  the data. So check MEDIAN() is able to handle the data in different 
--  language other than the default language.

DROP TABLE IF EXISTS japanese_employee_odd;

CREATE TABLE japanese_employee_odd (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    position TEXT
);

INSERT INTO japanese_employee_odd (employee_name, position) VALUES 
    ('田中一郎', 'エンジニア'),
    ('斎藤二郎', 'マーケティングマネージャー'),
    ('小林優子', 'プロダクトマネージャー');

SELECT employee_name FROM japanese_employee_odd order by employee_name;

SELECT median(employee_name) from japanese_employee_odd;


SELECT position FROM japanese_employee_odd order by position;

SELECT median(position) from japanese_employee_odd;

DROP TABLE IF EXISTS japanese_employee_even;

CREATE TABLE japanese_employee_even (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    position TEXT
);

INSERT INTO japanese_employee_even (employee_name, position) VALUES 
    ('田中一郎', 'エンジニア'),
    ('高橋花子', 'デザイナー'),
    ('斎藤二郎', 'マーケティングマネージャー'),
    ('小林優子', 'プロダクトマネージャー');


SELECT employee_name FROM japanese_employee_even order by employee_name;         
                                                                                
SELECT median(employee_name) from japanese_employee_even;                        
                                                                                
                                                                                
SELECT position FROM japanese_employee_even order by position;                   
                                                                                
SELECT median(position) from japanese_employee_even;


