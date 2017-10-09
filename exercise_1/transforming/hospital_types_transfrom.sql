DROP TABLE HospitalTypes_tmp;
CREATE TABLE HospitalTypes_tmp AS
SELECT 	DISTINCT HospitalType AS Name
FROM	hospital_base;

DROP TABLE HospitalTypes;
CREATE TABLE HospitalTypes AS
SELECT	row_number() OVER () AS HospitalTypeId,
	Name
FROM	HospitalTypes_tmp;

DROP TABLE HospitalTypes_tmp;
