DROP TABLE HospitalOwnerships_tmp;
CREATE TABLE HospitalOwnerships_tmp AS
SELECT 	DISTINCT HospitalOwnership AS Name
FROM	hospital_base;

DROP TABLE HospitalOwnerships;
CREATE TABLE HospitalOwnerships AS
SELECT	row_number() OVER () AS HospitalOwnershipId,
	Name
FROM	HospitalOwnerships_tmp;

DROP TABLE HospitalOwnerships_tmp;
