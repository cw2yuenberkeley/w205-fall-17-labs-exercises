DROP TABLE HospitalProcedureResults_tmp;
CREATE TABLE HospitalProcedureResults_tmp AS
SELECT 	ProviderID AS HospitalId,
	MeasureID AS ProcedureId,
	IF(Score == "Not Available", -1, CAST(Score AS FLOAT)) AS Score,
	Footnote
FROM readmissions_and_deaths_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	MeasureID AS ProcedureId,
	CASE WHEN Score == "Not Available" THEN -1
	WHEN Score == "High (40,000 - 59,999 patients annually)" THEN 40000
	WHEN Score == "Low (0 - 19,999 patients annually)" THEN 0
	WHEN Score == "Medium (20,000 - 39,999 patients annually)" THEN 20000
	WHEN Score == "Very High (60,000+ patients annually)" THEN 60000
	ELSE CAST(Score AS FLOAT) END AS Score,
	Footnote
FROM timely_and_effective_care_base;

DROP TABLE HospitalProcedureResults_AvgVar_tmp;
CREATE TABLE HospitalProcedureResults_AvgVar_tmp AS
SELECT 	ProcedureId,
	AVG(Score) AS ScoreAvg,
	VARIANCE(Score) AS ScoreVar
FROM	HospitalProcedureResults_tmp
WHERE Score <> -1
GROUP BY ProcedureId;

DROP TABLE HospitalProcedureResults;
CREATE TABLE HospitalProcedureResults AS
SELECT	HospitalId,
	H1.ProcedureId,
	Score,
	CASE WHEN Score == -1 THEN -1 ELSE (Score - ScoreAvg)/ScoreVar END NormalizedScore,
	FootNote
FROM	HospitalProcedureResults_tmp H1 INNER JOIN HospitalProcedureResults_AvgVar_tmp H2 ON H1.ProcedureId == H2.ProcedureId;
