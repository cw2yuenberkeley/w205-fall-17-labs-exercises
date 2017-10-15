-- Question:
-- Are average scores for hospital quality or procedural variability correlated with patient survey responses?
--
-- Interpretation of the Question:
-- - There are two correlations we need to look at: correlation of average scores for hospital quality and patient survey responses and correlation of variability of hospital quality with patient survey responses
--
-- Approach:
-- - Use the normalized score for procedure scores (Score where != -1 minus Avg score across
-- hospitals, then divide by Variance score across hospitals).
-- - Use the HCAHPS Base Score as the main score for patient survey responses. According to http://hcahpsonline.org/files/HCAHPS%20Fact%20Sheet%20May%202012.pdf, the Base score seems to encapsulate scores across the survey questions, hence no manual aggregation is needed
-- - Filter out normalized procedure scores and base scores where they are -1 (e.g. not available)
-- - Take the correlation of avg NormalizedScore (for procedures) and NormalizedBaseScore (for surveys) as well as correlation of variance of NormalizedScore (for procedures) and NormalizedBaseScore (for surveys) to see if there is a correlation.
--
-- Intepretation of the Results:
-- - There seems to be a slight negative correlation between avg normalized procedure scores with base score for surveys (-0.21)
-- - There is almost no correlation between variance of normalized procedure scores with base score for surveys (-0.02)

DROP TABLE HospitalProcedureSurveyScores_tmp;
CREATE TABLE HospitalProcedureSurveyScores_tmp AS
SELECT  HPR.HospitalId,
        AVG(NormalizedScore) AvgNormalizedProcedureScore,
        VARIANCE(NormalizedScore) VarNormalizedProcedureScore,
        NormalizedBaseScore
FROM    HospitalProcedureResults HPR INNER JOIN SurveyResults SR ON HPR.HospitalId == SR.HospitalId
WHERE   NormalizedScore <> -1 AND NormalizedBaseScore <> -1
GROUP BY HPR.HospitalId, NormalizedBaseScore;

SELECT  CORR(AvgNormalizedProcedureScore, NormalizedBaseScore) AS Corr_AvgProcedureScore_SurveyScore,
        CORR(VarNormalizedProcedureScore, NormalizedBaseScore) AS Corr_VarProcedureScore_SurveyScore
FROM    HospitalProcedureSurveyScores_tmp;

DROP TABLE HospitalProcedureSurveyScores_tmp;
