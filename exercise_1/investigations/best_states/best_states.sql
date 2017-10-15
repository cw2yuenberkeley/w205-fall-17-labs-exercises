-- Question:
-- What states are models of high-quality care? 
--
-- Interpretation of the Question:
-- - To aggregate procedure scores for a state, the scores need to be
-- normalized. This means we need to normalize the scores by subtracting from
-- the mean of the procedure score across hospitals and states and then divide by the standard deviation of the
-- procedure score across hospitals and states.
-- - Some states do not have many procedure scores available. We should
-- exclude those states that do not have enough procedure scores as the
-- aggregates for that hospital may be biased.
--
-- Approach:
-- - Use the normalized score (Score where != -1 minue Avg score across
-- hospitals, then divide by standard deviation score across hospitals).
-- - Compute normalized score average, normalized score standard deviation and procedure
-- score count
-- - Filter out hospitals with SDNormalizedScore > 1.0 (e.g. hospitals with
-- very high standard deviation in procedure scores) and filter out states with
-- NumScores < 30 (e.g. states without enough procedure scores)
-- - With the remaining states, pick the top 10 by AvgNormalizedScore
--
-- Intepretation of the Results:
-- - AvgNormalizedScore - The selected top states are based on scores that are normalized. The
-- average normalized score represents on average of how many standard
-- deviations away from the average procedure score the hospital's procedure
-- scores were.
-- - SDNormalizedScore - The selected top states must have
-- SDNormalizedScore < 1.0, meaning the standard deviation of the normalized scores must
-- be less than 1 standard deviation.
-- - NumScores - The selected top states must have NumScores > 30 meaning
-- they must have more than 10 procedure scores available.

SELECT 	S.Name AS StateName, 
	AVG(CASE WHEN NormalizedScore == -1 THEN NULL ELSE NormalizedScore END) AvgNormalizedScore, 
	STDDEV_POP(CASE WHEN NormalizedScore == -1 THEN NULL ELSE NormalizedScore END) SDNormalizedScore, 
	SUM(CASE WHEN NormalizedScore == -1 THEN 0 ELSE 1 END) NumScores
FROM 	HospitalProcedureResults HPR INNER JOIN Hospitals H ON HPR.HospitalId == H.HospitalId
	INNER JOIN States S ON H.StateId == S.StateId
GROUP BY S.Name
HAVING SDNormalizedScore < 1.0 AND NumScores > 30
ORDER BY AvgNormalizedScore DESC
LIMIT 10;
