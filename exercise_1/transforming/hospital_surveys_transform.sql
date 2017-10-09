DROP TABLE HospitalSurveys_tmp;
CREATE TABLE HospitalSurveys_tmp AS
SELECT 	ProviderID AS HospitalId,
	'CommunicationwithNurses' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationwithNursesAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CommunicationWithNursesImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithNursesImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CommunicationWithNursesDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithNursesDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'CommunicationWithDoctors' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CommunicationWithDoctorsImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CommunicationWithDoctorsDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'ResponsivenessOfHospital' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(ResponsivenessOfHospitalStaffImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(ResponsivenessOfHospitalStaffDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffDimensionScore , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'PainManagement' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementAchievementPoints , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(PainManagementImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementImprovementPoints , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(PainManagementDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementDimensionScore , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'CommunicationAboutMedicines' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesAchievementPoints , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CommunicationAboutMedicinesImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesImprovementPoints , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(CommunicationAboutMedicinesDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesDimensionScore , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'CleanlinessAndQuietnessOfHospitalEnvironment' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints  , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints  , '^([\\w\\-]+)', 1)) AS INT) AS ImprovementPoints,
	IF(CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore  , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'DischargeInformation' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationAchievementPoints   , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(DischargeInformationImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationImprovementPoints   , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(DischargeInformationDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationDimensionScore   , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base
UNION ALL
SELECT 	ProviderID AS HospitalId,
	'OverallRatingOfHospital' AS Name,
	IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalAchievementPoints    , '^([\\w\\-]+)', 1) AS INT)) AS AchievementPoints,
	IF(OverallRatingOfHospitalImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalImprovementPoints    , '^([\\w\\-]+)', 1) AS INT)) AS ImprovementPoints,
	IF(OverallRatingOfHospitalDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalDimensionScore    , '^([\\w\\-]+)', 1) AS INT)) AS DimensionScore
FROM 	hvbp_hcahps_base;

DROP TABLE HospitalSurveys;
CREATE TABLE HospitalSurveys AS
SELECT 	HospitalId,
	row_number() OVER () AS SurveyId,
	SurveyResultTypeId,
	AchievementPoints,
	ImprovementPoints,
	DimensionScore
FROM HospitalSurveys_tmp;

DROP TABLE HospitalSurveys_tmp;
