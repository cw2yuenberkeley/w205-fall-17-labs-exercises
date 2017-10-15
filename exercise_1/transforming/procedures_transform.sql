DROP TABLE Procedures;
CREATE TABLE Procedures AS
SELECT	MeasureID AS ProcedureId,	
	MeasureName AS Name,
	MeasureStartQuarter AS StartQuarter,
	TO_DATE(MeasureStartDate) AS StartDate,
	MeasureEndQuarter AS EndQuarter,
	TO_DATE(MeasureEndDate) AS EndDate,
	COUNT(DISTINCT Score) AS DistinctScores
FROM 	measure_dates_base MDB INNER JOIN HospitalProcedureResults HPR ON MDB.MeasureID == HPR.ProcedureId
GROUP BY MDB.MeasureID, MDB.MeasureName, MeasureStartQuarter, TO_DATE(MeasureStartDate), MeasureEndQuarter, TO_DATE(MeasureEndDate);
