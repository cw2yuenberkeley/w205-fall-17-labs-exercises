-- Question:
-- What hospitals are models of high-quality care?  That is, which
-- hospitals have the most consistently high scores for a variety of procedures
--
-- Interpretation of the Question:
-- - To aggregate procedure scores for a hospital, the scores need to be
-- normalized. This means we need to normalize the scores by subtracting from
-- the mean of the procedure score across hospitals  and then divide by the standard deviation of the
-- procedure score across hospitals.
-- - Some hospitals do not have many procedure scores available. We should
-- exclude those hospitals that does not have enough procedure scores as the
-- aggregates for that hospital may be biased.
--
-- Approach:
-- - Use the normalized score (Score where != -1 minue Avg score across
-- hospitals, then divide by standard deviation score across hospitals).
-- - Compute normalized score average, normalized score standard deviation and procedure
-- score count
-- - Filter out hospitals with SDNormalizedScore > 1.0 (e.g. hospitals with
-- very high standard deviation in procedure scores) and filter out hospitals with
-- NumScores < 10 (e.g. hospitals without enough procedure scores)
-- - With the remaining hospitals, pick the top 20 by AvgNormalizedScore
--
-- Intepretation of the Results:
-- - AvgNormalizedScore - The selected top hospitals are based on scores that are normalized. The
-- average normalized score represents on average of how many standard
-- deviations away from the average procedure score the hospital's procedure
-- scores were.
-- - SDNormalizedScore - The selected top hospitals must have
-- SDNormalizedScore < 1.0, meaning the standard deviation of the normalized scores must
-- be less than 1 standard deviation.
-- - NumScores - The selected top hospitals must have NumScores > 10 meaning
-- they must have more than 10 procedure scores available.

SELECT 	H.Name AS HospitalName, 
	AVG(CASE WHEN NormalizedScore == -1 THEN NULL ELSE NormalizedScore END) AvgNormalizedScore, 
	STdDEV_POP(CASE WHEN NormalizedScore == -1 THEN NULL ELSE NormalizedScore END) SDNormalizedScore, 
	SUM(CASE WHEN NormalizedScore == -1 THEN 0 ELSE 1 END) NumScores
FROM 	HospitalProcedureResults HPR INNER JOIN Hospitals H ON HPR.HospitalId == H.HospitalId
GROUP BY H.Name
HAVING SDNormalizedScore < 1.0 AND NumScores > 10
ORDER BY AvgNormalizedScore DESC
LIMIT 20;
