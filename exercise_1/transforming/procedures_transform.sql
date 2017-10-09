DROP TABLE Procedures;
CREATE TABLE Procedures AS
SELECT	ProviderID AS HospitalId,
	MeasureID AS ProcedureMeasureId,
	Score,
	Footnote
FROM 	readmissions_and_deaths_base
UNION ALL 
SELECT 	ProviderID AS HospitalId,
	MeasureID AS ProcedureMeasureId,
	Score,
	Footnote
FROM 	timely_and_effective_care_base;
