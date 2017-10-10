DROP TABLE Hospitals;
CREATE TABLE Hospitals AS
SELECT 	ProviderID AS HospitalId,
	HospitalName AS Name,
	Address,
	CI.CityId,
	ST.StateId,
	Zipcode,
	CO.CountyId,
	PhoneNumber,
	HT.HospitalTypeId,
	HO.HospitalOwnershipId,
	EmergencyServices = "YES" AS HasEmergencyServcies
FROM	hospital_base H 
	INNER JOIN Cities CI ON H.City = CI.Name 
	INNER JOIN States ST ON H.State = ST.Name
	INNER JOIN Counties CO ON H.CountyName = CO.Name
	INNER JOIN HospitalTypes HT ON H.HospitalType = HT.Name
	INNER JOIN HospitalOwnerships HO ON H.HospitalOwnership = HO.Name;
