DROP TABLE Cities_tmp;
CREATE TABLE Cities_tmp AS
SELECT 	DISTINCT City AS Name
FROM	hospital_base;

DROP TABLE Cities;
CREATE TABLE Cities AS
SELECT	row_number() OVER () AS CityId,
	Name
FROM	Cities_tmp;

DROP TABLE Cities_tmp;
