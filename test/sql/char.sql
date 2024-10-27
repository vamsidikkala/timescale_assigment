-- Character Data Type Examples in PostgreSQL

-- 1. character varying(n)
DROP TABLE IF EXISTS char_varying_table_odd;
DROP TABLE IF EXISTS char_varying_table_even;

CREATE TABLE char_varying_table_odd (id character varying(20));
CREATE TABLE char_varying_table_even (id character varying(20));

-- Insert 5 values into the odd table
INSERT INTO char_varying_table_odd VALUES ('Alice');
INSERT INTO char_varying_table_odd VALUES ('Bob');
INSERT INTO char_varying_table_odd VALUES ('Charlie');
INSERT INTO char_varying_table_odd VALUES ('Daisy');
INSERT INTO char_varying_table_odd VALUES ('Evan');

-- Insert 4 values into the even table
INSERT INTO char_varying_table_even VALUES ('Alice');
INSERT INTO char_varying_table_even VALUES ('Bob');
INSERT INTO char_varying_table_even VALUES ('Charlie');
INSERT INTO char_varying_table_even VALUES ('Daisy');

-- 2. varchar(n)
DROP TABLE IF EXISTS varchar_table_odd;
DROP TABLE IF EXISTS varchar_table_even;

CREATE TABLE varchar_table_odd (id varchar(20));
CREATE TABLE varchar_table_even (id varchar(20));

-- Insert 5 values into the odd table
INSERT INTO varchar_table_odd VALUES ('Zara');
INSERT INTO varchar_table_odd VALUES ('Liam');
INSERT INTO varchar_table_odd VALUES ('Noah');
INSERT INTO varchar_table_odd VALUES ('Emma');
INSERT INTO varchar_table_odd VALUES ('Ava');

-- Insert 4 values into the even table
INSERT INTO varchar_table_even VALUES ('Zara');
INSERT INTO varchar_table_even VALUES ('Liam');
INSERT INTO varchar_table_even VALUES ('Noah');
INSERT INTO varchar_table_even VALUES ('Emma');

-- 3. character(n)
DROP TABLE IF EXISTS character_table_odd;
DROP TABLE IF EXISTS character_table_even;

CREATE TABLE character_table_odd (id character(10));
CREATE TABLE character_table_even (id character(10));

-- Insert 5 values into the odd table
INSERT INTO character_table_odd VALUES ('Alpha     ');
INSERT INTO character_table_odd VALUES ('Beta      ');
INSERT INTO character_table_odd VALUES ('Gamma     ');
INSERT INTO character_table_odd VALUES ('Delta     ');
INSERT INTO character_table_odd VALUES ('Epsilon   ');

-- Insert 4 values into the even table
INSERT INTO character_table_even VALUES ('Alpha     ');
INSERT INTO character_table_even VALUES ('Beta      ');
INSERT INTO character_table_even VALUES ('Gamma     ');
INSERT INTO character_table_even VALUES ('Delta     ');

-- 4. char(n)
DROP TABLE IF EXISTS char_table_odd;
DROP TABLE IF EXISTS char_table_even;

CREATE TABLE char_table_odd (id char(10));
CREATE TABLE char_table_even (id char(10));

-- Insert 5 values into the odd table
INSERT INTO char_table_odd VALUES ('Tom       ');
INSERT INTO char_table_odd VALUES ('Jerry     ');
INSERT INTO char_table_odd VALUES ('Mickey    ');
INSERT INTO char_table_odd VALUES ('Minnie    ');
INSERT INTO char_table_odd VALUES ('Donald    ');

-- Insert 4 values into the even table
INSERT INTO char_table_even VALUES ('Tom       ');
INSERT INTO char_table_even VALUES ('Jerry     ');
INSERT INTO char_table_even VALUES ('Mickey    ');
INSERT INTO char_table_even VALUES ('Minnie    ');

-- 5. bpchar (variable unlimited length, blank-trimmed)
DROP TABLE IF EXISTS bpchar_table_odd;
DROP TABLE IF EXISTS bpchar_table_even;

CREATE TABLE bpchar_table_odd (id bpchar);
CREATE TABLE bpchar_table_even (id bpchar);

-- Insert 5 values into the odd table
INSERT INTO bpchar_table_odd VALUES ('Skylar');
INSERT INTO bpchar_table_odd VALUES ('Jordan');
INSERT INTO bpchar_table_odd VALUES ('Taylor');
INSERT INTO bpchar_table_odd VALUES ('Casey');
INSERT INTO bpchar_table_odd VALUES ('Avery');

-- Insert 4 values into the even table
INSERT INTO bpchar_table_even VALUES ('Skylar');
INSERT INTO bpchar_table_even VALUES ('Jordan');
INSERT INTO bpchar_table_even VALUES ('Taylor');
INSERT INTO bpchar_table_even VALUES ('Casey');

-- 6. text (variable unlimited length)
DROP TABLE IF EXISTS text_table_odd;
DROP TABLE IF EXISTS text_table_even;

CREATE TABLE text_table_odd (id text);
CREATE TABLE text_table_even (id text);

-- Insert 5 values into the odd table
INSERT INTO text_table_odd VALUES ('Lorem ipsum');
INSERT INTO text_table_odd VALUES ('dolor sit amet');
INSERT INTO text_table_odd VALUES ('consectetur adipiscing elit');
INSERT INTO text_table_odd VALUES ('sed do eiusmod');
INSERT INTO text_table_odd VALUES ('tempor incididunt');

-- Insert 4 values into the even table
INSERT INTO text_table_even VALUES ('Lorem ipsum');
INSERT INTO text_table_even VALUES ('dolor sit amet');
INSERT INTO text_table_even VALUES ('consectetur adipiscing elit');
INSERT INTO text_table_even VALUES ('sed do eiusmod');


-- Order by statements for each character type table

-- 1. character varying(n)
SELECT * FROM char_varying_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM char_varying_table_odd;
SELECT * FROM char_varying_table_even ORDER BY id;
SELECT median(id) AS median_value FROM char_varying_table_even;

-- 2. varchar(n)
SELECT * FROM varchar_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM varchar_table_odd;
SELECT * FROM varchar_table_even ORDER BY id;
SELECT median(id) AS median_value FROM varchar_table_even;

-- 3. character(n)
SELECT * FROM character_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM character_table_odd;
SELECT * FROM character_table_even ORDER BY id;
SELECT median(id) AS median_value FROM character_table_even;

-- 4. char(n)
SELECT * FROM char_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM char_table_odd;
SELECT * FROM char_table_even ORDER BY id;
SELECT median(id) AS median_value FROM char_table_even;

-- 5. bpchar (variable unlimited length, blank-trimmed)
SELECT * FROM bpchar_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM bpchar_table_odd;
SELECT * FROM bpchar_table_even ORDER BY id;
SELECT median(id) AS median_value FROM bpchar_table_even;

-- 6. text (variable unlimited length)
SELECT * FROM text_table_odd ORDER BY id;
SELECT median(id) AS median_value FROM text_table_odd;
SELECT * FROM text_table_even ORDER BY id;
SELECT median(id) AS median_value FROM text_table_even;

