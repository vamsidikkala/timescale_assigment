-- Test Geometric Point and LINE data type
-- This is negative test and we are supposed to get the error if result 
-- set contains atleast one element.
-- If result contains empty set, then no error is returned and empty row is 
-- returned. This is because, if result set doesn't contain any data the 
-- median_transfn is not called, and not possible to get the data type in 
-- median_finalfn. So we are returning empty result set.


-- 1. point
DROP TABLE IF EXISTS point_table_odd;
DROP TABLE IF EXISTS point_table_even;

CREATE TABLE point_table_odd (id point);
CREATE TABLE point_table_even (id point);

INSERT INTO point_table_odd VALUES (POINT(1, 2));
INSERT INTO point_table_odd VALUES (POINT(3, 4));
INSERT INTO point_table_odd VALUES (POINT(5, 6));
INSERT INTO point_table_odd VALUES (POINT(7, 8));
INSERT INTO point_table_odd VALUES (POINT(9, 10));

INSERT INTO point_table_even VALUES (POINT(11, 12));
INSERT INTO point_table_even VALUES (POINT(13, 14));
INSERT INTO point_table_even VALUES (POINT(15, 16));
INSERT INTO point_table_even VALUES (POINT(17, 18));

SELECT * FROM point_table_odd ORDER BY id;
SELECT * FROM point_table_even ORDER BY id;

SELECT median(id) AS median_value FROM point_table_odd;
SELECT median(id) AS median_value FROM point_table_even;

-- 2. line 
DROP TABLE IF EXISTS line_table_odd;
DROP TABLE IF EXISTS line_table_even;

CREATE TABLE line_table_odd (id line);
CREATE TABLE line_table_even (id line);

SELECT median(id) AS median_value FROM line_table_odd;
SELECT median(id) AS median_value FROM line_table_even;

