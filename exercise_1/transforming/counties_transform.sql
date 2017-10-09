DROP TABLE Counties_tmp;
CREATE TABLE Counties_tmp AS
SELECT 	DISTINCT CountyName AS Name
FROM	hospital_base;

DROP TABLE Counties;
CREATE TABLE Counties AS
SELECT	row_number() OVER () AS CountyId,
	Name
FROM	Counties_tmp;

DROP TABLE Counties_tmp;
