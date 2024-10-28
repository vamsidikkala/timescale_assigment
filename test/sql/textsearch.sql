-- test TSVECTOR and TSQUERY data types

-- 1. TSVECTOR
DROP TABLE IF EXISTS tsvector_table_odd;
DROP TABLE IF EXISTS tsvector_table_even;

CREATE TABLE tsvector_table_odd (id TSVECTOR);
CREATE TABLE tsvector_table_even (id TSVECTOR);

INSERT INTO tsvector_table_odd VALUES (to_tsvector('PostgreSQL is a powerful, open source object-relational database system'));
INSERT INTO tsvector_table_odd VALUES (to_tsvector('The quick brown fox jumps over the lazy dog'));
INSERT INTO tsvector_table_odd VALUES (to_tsvector('Data types and their operations'));
INSERT INTO tsvector_table_odd VALUES (to_tsvector('Full-text search is useful'));
INSERT INTO tsvector_table_odd VALUES (to_tsvector('Natural language processing in PostgreSQL'));

INSERT INTO tsvector_table_even VALUES (to_tsvector('SQL scripts can be generated easily'));
INSERT INTO tsvector_table_even VALUES (to_tsvector('Indexes improve query performance'));
INSERT INTO tsvector_table_even VALUES (to_tsvector('Use tsvector for text searching'));
INSERT INTO tsvector_table_even VALUES (to_tsvector('PostgreSQL supports various data types'));

SELECT * FROM tsvector_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM tsvector_table_odd;

SELECT * FROM tsvector_table_even ORDER BY id;

SELECT median(id) AS median_value FROM tsvector_table_even;

-- 2. TSQUERY
DROP TABLE IF EXISTS tsquery_table_odd;
DROP TABLE IF EXISTS tsquery_table_even;

CREATE TABLE tsquery_table_odd (id TSQUERY);
CREATE TABLE tsquery_table_even (id TSQUERY);

INSERT INTO tsquery_table_odd VALUES (to_tsquery('PostgreSQL & powerful'));
INSERT INTO tsquery_table_odd VALUES (to_tsquery('quick | brown | fox'));
INSERT INTO tsquery_table_odd VALUES (to_tsquery('data & types'));
INSERT INTO tsquery_table_odd VALUES (to_tsquery('fulltext & search'));
INSERT INTO tsquery_table_odd VALUES (to_tsquery('natural & language & processing'));

INSERT INTO tsquery_table_even VALUES (to_tsquery('SQL & scripts'));
INSERT INTO tsquery_table_even VALUES (to_tsquery('indexes | performance'));
INSERT INTO tsquery_table_even VALUES (to_tsquery('text & searching'));
INSERT INTO tsquery_table_even VALUES (to_tsquery('supports & various & data'));

SELECT * FROM tsquery_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM tsquery_table_odd;

SELECT * FROM tsquery_table_even ORDER BY id;

SELECT median(id) AS median_value FROM tsquery_table_even;

