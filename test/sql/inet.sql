-- Test Networking data types

-- 1. cidr
DROP TABLE IF EXISTS cidr_table_odd;
DROP TABLE IF EXISTS cidr_table_even;

CREATE TABLE cidr_table_odd (id cidr);
CREATE TABLE cidr_table_even (id cidr);

INSERT INTO cidr_table_odd VALUES ('192.168.1.0/24');
INSERT INTO cidr_table_odd VALUES ('10.0.0.0/8');
INSERT INTO cidr_table_odd VALUES ('172.16.0.0/12');
INSERT INTO cidr_table_odd VALUES ('192.168.100.0/24');
INSERT INTO cidr_table_odd VALUES ('10.1.1.0/24');

INSERT INTO cidr_table_even VALUES ('192.168.2.0/24');
INSERT INTO cidr_table_even VALUES ('10.2.2.0/24');
INSERT INTO cidr_table_even VALUES ('172.20.0.0/16');
INSERT INTO cidr_table_even VALUES ('10.3.3.0/24');

SELECT * FROM cidr_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM cidr_table_odd;

SELECT * FROM cidr_table_even ORDER BY id;

SELECT median(id) AS median_value FROM cidr_table_even;

-- 2. inet
DROP TABLE IF EXISTS inet_table_odd;
DROP TABLE IF EXISTS inet_table_even;

CREATE TABLE inet_table_odd (id inet);
CREATE TABLE inet_table_even (id inet);

INSERT INTO inet_table_odd VALUES ('192.168.1.1');
INSERT INTO inet_table_odd VALUES ('10.0.0.1');
INSERT INTO inet_table_odd VALUES ('172.16.0.1');
INSERT INTO inet_table_odd VALUES ('192.168.100.1');
INSERT INTO inet_table_odd VALUES ('10.1.1.1');

INSERT INTO inet_table_even VALUES ('192.168.2.1');
INSERT INTO inet_table_even VALUES ('10.2.2.1');
INSERT INTO inet_table_even VALUES ('172.20.0.1');
INSERT INTO inet_table_even VALUES ('10.3.3.1');

SELECT * FROM inet_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM inet_table_odd;

SELECT * FROM inet_table_even ORDER BY id;

SELECT median(id) AS median_value FROM inet_table_even;


-- 3. macaddr
DROP TABLE IF EXISTS macaddr_table_odd;
DROP TABLE IF EXISTS macaddr_table_even;

CREATE TABLE macaddr_table_odd (id macaddr);
CREATE TABLE macaddr_table_even (id macaddr);

INSERT INTO macaddr_table_odd VALUES ('08:00:20:4b:01:00');
INSERT INTO macaddr_table_odd VALUES ('00:14:22:01:23:45');
INSERT INTO macaddr_table_odd VALUES ('00:1A:2B:3C:4D:5E');
INSERT INTO macaddr_table_odd VALUES ('00:1B:44:11:3A:B7');
INSERT INTO macaddr_table_odd VALUES ('00:1C:42:00:00:01');

INSERT INTO macaddr_table_even VALUES ('00:1D:92:01:23:45');
INSERT INTO macaddr_table_even VALUES ('00:1E:8C:6E:9D:F2');
INSERT INTO macaddr_table_even VALUES ('00:1F:3E:4C:5B:6A');
INSERT INTO macaddr_table_even VALUES ('00:1F:4D:5E:6F:7A');

SELECT * FROM macaddr_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM macaddr_table_odd;

SELECT * FROM macaddr_table_even ORDER BY id;

SELECT median(id) AS median_value FROM macaddr_table_even;


-- 4. macaddr8
DROP TABLE IF EXISTS macaddr8_table_odd;
DROP TABLE IF EXISTS macaddr8_table_even;

CREATE TABLE macaddr8_table_odd (id macaddr8);
CREATE TABLE macaddr8_table_even (id macaddr8);

INSERT INTO macaddr8_table_odd VALUES ('08:00:20:4b:01:00:00:00');
INSERT INTO macaddr8_table_odd VALUES ('00:14:22:01:23:45:00:00');
INSERT INTO macaddr8_table_odd VALUES ('00:1A:2B:3C:4D:5E:00:00');
INSERT INTO macaddr8_table_odd VALUES ('00:1B:44:11:3A:B7:00:00');
INSERT INTO macaddr8_table_odd VALUES ('00:1C:42:00:00:01:00:00');

INSERT INTO macaddr8_table_even VALUES ('00:1D:92:01:23:45:00:00');
INSERT INTO macaddr8_table_even VALUES ('00:1E:8C:6E:9D:F2:00:00');
INSERT INTO macaddr8_table_even VALUES ('00:1F:3E:4C:5B:6A:00:00');
INSERT INTO macaddr8_table_even VALUES ('00:1F:4D:5E:6F:7A:00:00');

SELECT * FROM macaddr8_table_odd ORDER BY id;

SELECT median(id) AS median_value FROM macaddr8_table_odd;

SELECT * FROM macaddr8_table_even ORDER BY id;

SELECT median(id) AS median_value FROM macaddr8_table_even;

