DROP TABLE HospitalProcedureResults;
CREATE TABLE HospitalProcedureResults AS
SELECT 	ProviderID AS HospitalId,
	MeasureID AS ProcedureId,
	CAST(Score AS FLOAT) AS Score,
	Footnote
FROM readmissions_and_deaths_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	MeasureID AS ProcedureId,
	CAST(Score AS FLOAT) AS Score,
	Footnote
FROM timely_and_effective_care_base;
