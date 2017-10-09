DROP TABLE HospitalOwnerhship_tmp;
CREATE TABLE HospitalOwnership_tmp AS
SELECT 	DISTINCT HospitalOwnership AS Name
FROM	hospital_base;

DROP TABLE HospitalOwnerships;
CREATE TABLE HospitalOwnerships AS
SELECT	row_number() OVER () AS HospitalOwnershipId,
	Name
FROM	HospitalOwnerhship_tmp;

DROP TABLE HospitalOwnerships_tmp;
