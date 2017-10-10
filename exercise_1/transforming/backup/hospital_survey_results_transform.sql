DROP TABLE HospitalSurveyResults;
CREATE TABLE HospitalSurveyResults AS
SELECT 	ProviderID AS HospitalId,
	1 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationwithNursesAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CommunicationWithNursesImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithNursesImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CommunicationWithNursesDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithNursesDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	2 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CommunicationWithDoctorsImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CommunicationWithDoctorsDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	3 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(ResponsivenessOfHospitalStaffImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(ResponsivenessOfHospitalStaffDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffDimensionScore , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId, 
	4 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementAchievementPoints , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(PainManagementImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementImprovementPoints , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(PainManagementDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementDimensionScore , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	5 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesAchievementPoints , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CommunicationAboutMedicinesImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesImprovementPoints , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CommunicationAboutMedicinesDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesDimensionScore , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	6 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints  , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints  , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore  , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	7 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationAchievementPoints   , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(DischargeInformationImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationImprovementPoints   , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(DischargeInformationDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationDimensionScore   , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	8 AS SurveyId,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalAchievementPoints    , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(OverallRatingOfHospitalImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalImprovementPoints    , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(OverallRatingOfHospitalDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalDimensionScore    , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base;
