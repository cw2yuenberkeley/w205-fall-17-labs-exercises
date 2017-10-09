DROP TABLE ProcedureMeasures;
CREATE TABLE ProcedureMeasures AS
SELECT 	MeasureID AS ProcedureMeasureId,
	MeasureName AS Name,
	MeasureStartQuarter AS StartQuarter,
	MeasureStartDate  AS StartDate,
	MeasureEndQuarter  AS EndQuarter,
	MeasureEndDate AS EndDate
FROM measure_dates_base;
