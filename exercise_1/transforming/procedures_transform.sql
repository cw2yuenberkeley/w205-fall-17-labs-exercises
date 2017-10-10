DROP TABLE Procedures;
CREATE TABLE Procedures AS
SELECT	MeasureID AS ProcedureId,	
	MeasureName AS Name,
	MeasureStartQuarter AS StartQuarter,
	TO_DATE(MeasureStartDate) AS StartDate,
	MeasureEndQuarter AS EndQuarter,
	TO_DATE(MeasureEndDate) AS EndDate
FROM 	measure_dates_base;
