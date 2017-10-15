-- Question:
-- Which procedures have the greatest variability between hospitals?
--
-- Interpretation of the Question:
-- - We need to look at procedure scores and see which ones have high variability in the scores across hospitals
--
-- Approach
-- - To compare across procedures, we will use the NormalizedScore as the procedure scores (Score where != -1 minus Avg score across
-- hospitals, then divide by Variance score across hospitals).
-- - We filter out procedures with low distinct scores, this is because it is likely that these procedures do not have high variation anyway, but their normalized scores will result in high variation.
-- - We take the variance of the normalized scores.
--
-- Intepretation of the Results:
-- - The top procedures with high variance varies from 2.5 to about 0.6 based on the NormalizedScore

SELECT 	P.Name,
	VARIANCE(NormalizedScore) AS ScoreVariance
FROM 	Procedures P INNER JOIN HospitalProcedureResults HPR ON P.ProcedureId == HPR.ProcedureId
WHERE 	NormalizedScore <> -1
GROUP BY P.Name
ORDER BY ScoreVariance DESC
LIMIT 20;
