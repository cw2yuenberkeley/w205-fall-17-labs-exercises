DROP TABLE States_tmp;
CREATE TABLE States_tmp AS
SELECT	DISTINCT State AS Name
FROM	hospital_base;

DROP TABLE States;
CREATE TABLE States AS
SELECT	row_number() OVER () AS StateId,
	Name
FROM	States_tmp;

DROP TABLE States_tmp;
