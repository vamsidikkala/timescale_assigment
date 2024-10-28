-- Test Character data types

-- 1. character varying(n)
DROP TABLE IF EXISTS char_varying_table_odd;
DROP TABLE IF EXISTS char_varying_table_even;

CREATE TABLE char_varying_table_odd (id character varying(20));
CREATE TABLE char_varying_table_even (id character varying(20));

INSERT INTO char_varying_table_odd VALUES ('Alice');
INSERT INTO char_varying_table_odd VALUES ('Bob');
INSERT INTO char_varying_table_odd VALUES ('Charlie');
INSERT INTO char_varying_table_odd VALUES ('Daisy');
INSERT INTO char_varying_table_odd VALUES ('Evan');

INSERT INTO char_varying_table_even VALUES ('Alice');
INSERT INTO char_varying_table_even VALUES ('Bob');
INSERT INTO char_varying_table_even VALUES ('Charlie');
INSERT INTO char_varying_table_even VALUES ('Daisy');


SELECT * FROM char_varying_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM char_varying_table_odd;
SELECT * FROM char_varying_table_even ORDER BY id;
SELECT median(id) AS median_value FROM char_varying_table_even;


-- 2. varchar(n)
DROP TABLE IF EXISTS varchar_table_odd;
DROP TABLE IF EXISTS varchar_table_even;

CREATE TABLE varchar_table_odd (id varchar(20));
CREATE TABLE varchar_table_even (id varchar(20));

INSERT INTO varchar_table_odd VALUES ('Zara');
INSERT INTO varchar_table_odd VALUES ('Liam');
INSERT INTO varchar_table_odd VALUES ('Noah');
INSERT INTO varchar_table_odd VALUES ('Emma');
INSERT INTO varchar_table_odd VALUES ('Ava');

INSERT INTO varchar_table_even VALUES ('Zara');
INSERT INTO varchar_table_even VALUES ('Liam');
INSERT INTO varchar_table_even VALUES ('Noah');
INSERT INTO varchar_table_even VALUES ('Emma');

SELECT * FROM varchar_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM varchar_table_odd;
SELECT * FROM varchar_table_even ORDER BY id;
SELECT median(id) AS median_value FROM varchar_table_even;

-- 3. character(n)
DROP TABLE IF EXISTS character_table_odd;
DROP TABLE IF EXISTS character_table_even;

CREATE TABLE character_table_odd (id character(10));
CREATE TABLE character_table_even (id character(10));

INSERT INTO character_table_odd VALUES ('Alpha     ');
INSERT INTO character_table_odd VALUES ('Beta      ');
INSERT INTO character_table_odd VALUES ('Gamma     ');
INSERT INTO character_table_odd VALUES ('Delta     ');
INSERT INTO character_table_odd VALUES ('Epsilon   ');

INSERT INTO character_table_even VALUES ('Alpha     ');
INSERT INTO character_table_even VALUES ('Beta      ');
INSERT INTO character_table_even VALUES ('Gamma     ');
INSERT INTO character_table_even VALUES ('Delta     ');

SELECT * FROM character_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM character_table_odd;
SELECT * FROM character_table_even ORDER BY id;
SELECT median(id) AS median_value FROM character_table_even;

-- 4. char(n)
DROP TABLE IF EXISTS char_table_odd;
DROP TABLE IF EXISTS char_table_even;

CREATE TABLE char_table_odd (id char(10));
CREATE TABLE char_table_even (id char(10));

INSERT INTO char_table_odd VALUES ('Tom       ');
INSERT INTO char_table_odd VALUES ('Jerry     ');
INSERT INTO char_table_odd VALUES ('Mickey    ');
INSERT INTO char_table_odd VALUES ('Minnie    ');
INSERT INTO char_table_odd VALUES ('Donald    ');

INSERT INTO char_table_even VALUES ('Tom       ');
INSERT INTO char_table_even VALUES ('Jerry     ');
INSERT INTO char_table_even VALUES ('Mickey    ');
INSERT INTO char_table_even VALUES ('Minnie    ');

SELECT * FROM char_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM char_table_odd;
SELECT * FROM char_table_even ORDER BY id;
SELECT median(id) AS median_value FROM char_table_even;

-- 5. bpchar (variable unlimited length, blank-trimmed)
DROP TABLE IF EXISTS bpchar_table_odd;
DROP TABLE IF EXISTS bpchar_table_even;

CREATE TABLE bpchar_table_odd (id bpchar);
CREATE TABLE bpchar_table_even (id bpchar);

INSERT INTO bpchar_table_odd VALUES ('Skylar');
INSERT INTO bpchar_table_odd VALUES ('Jordan');
INSERT INTO bpchar_table_odd VALUES ('Taylor');
INSERT INTO bpchar_table_odd VALUES ('Casey');
INSERT INTO bpchar_table_odd VALUES ('Avery');

INSERT INTO bpchar_table_even VALUES ('Skylar');
INSERT INTO bpchar_table_even VALUES ('Jordan');
INSERT INTO bpchar_table_even VALUES ('Taylor');
INSERT INTO bpchar_table_even VALUES ('Casey');

SELECT * FROM bpchar_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM bpchar_table_odd;
SELECT * FROM bpchar_table_even ORDER BY id;
SELECT median(id) AS median_value FROM bpchar_table_even;

-- 6. text (variable unlimited length)
DROP TABLE IF EXISTS text_table_odd;
DROP TABLE IF EXISTS text_table_even;

CREATE TABLE text_table_odd (id text);
CREATE TABLE text_table_even (id text);

INSERT INTO text_table_odd VALUES ('Lorem ipsum');
INSERT INTO text_table_odd VALUES ('dolor sit amet');
INSERT INTO text_table_odd VALUES ('consectetur adipiscing elit');
INSERT INTO text_table_odd VALUES ('sed do eiusmod');
INSERT INTO text_table_odd VALUES ('tempor incididunt');

INSERT INTO text_table_even VALUES ('Lorem ipsum');
INSERT INTO text_table_even VALUES ('dolor sit amet');
INSERT INTO text_table_even VALUES ('consectetur adipiscing elit');
INSERT INTO text_table_even VALUES ('sed do eiusmod');


SELECT * FROM text_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM text_table_odd;
SELECT * FROM text_table_even ORDER BY id;
SELECT median(id) AS median_value FROM text_table_even;


