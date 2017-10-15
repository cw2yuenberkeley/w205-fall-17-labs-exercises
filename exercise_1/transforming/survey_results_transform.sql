DROP TABLE SurveyResults_tmp;
CREATE TABLE SurveyResults_tmp AS
SELECT	AVG(CAST(HcahpsBaseScore AS FLOAT)) AvgBaseScore,
	STDDEV_POP(CAST(HcahpsBaseScore AS FLOAT)) SDBaseScore
FROM	hvbp_hcahps_base 
WHERE	HcahpsBaseScore != "Not Available";

DROP TABLE SurveyResults;
CREATE TABLE SurveyResults AS
SELECT ProviderID AS HospitalId,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationwithNursesAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationwithNursesAchievementPoints,
IF(CommunicationWithNursesImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithNursesImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationWithNursesImprovementPoints,
IF(CommunicationWithNursesDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithNursesDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationWithNursesDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationWithDoctorsAchievementPoints,
IF(CommunicationWithDoctorsImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationWithDoctorsImprovementPoints,
IF(CommunicationWithDoctorsDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationWithDoctorsDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationWithDoctorsDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ResponsivenessOfHospitalStaffAchievementPoints,
IF(ResponsivenessOfHospitalStaffImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS ResponsivenessOfHospitalStaffImprovementPoints,
IF(ResponsivenessOfHospitalStaffDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(ResponsivenessOfHospitalStaffDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS ResponsivenessOfHospitalStaffDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS PainManagementAchievementPoints,
IF(PainManagementImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS PainManagementImprovementPoints,
IF(PainManagementDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(PainManagementDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS PainManagementDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationAboutMedicinesAchievementPoints,
IF(CommunicationAboutMedicinesImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationAboutMedicinesImprovementPoints,
IF(CommunicationAboutMedicinesDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CommunicationAboutMedicinesDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS CommunicationAboutMedicinesDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints,
IF(CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints,
IF(CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS DischargeInformationAchievementPoints,
IF(DischargeInformationImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS DischargeInformationImprovementPoints,
IF(DischargeInformationDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(DischargeInformationDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS DischargeInformationDimensionScore,
IF(CommunicationwithNursesAchievementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalAchievementPoints, '^([\\w\\-]+)', 1) AS INT)) AS OverallRatingOfHospitalAchievementPoints,
IF(OverallRatingOfHospitalImprovementPoints = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalImprovementPoints, '^([\\w\\-]+)', 1) AS INT)) AS OverallRatingOfHospitalImprovementPoints,
IF(OverallRatingOfHospitalDimensionScore = "Not Available", -1, CAST(REGEXP_EXTRACT(OverallRatingOfHospitalDimensionScore, '^([\\w\\-]+)', 1) AS INT)) AS OverallRatingOfHospitalDimensionScore,
IF(HcahpsBaseScore = "Not Available", -1,  CAST(HcahpsBaseScore AS INT)) AS BaseScore,
IF(HcahpsBaseScore = "Not Available", -1, (CAST(HcahpsBaseScore AS FLOAT)-AvgBaseScore)/SDBaseScore) AS NormalizedBaseScore,
IF(HcahpsConsistencyScore = "Not Available", -1, CAST(HcahpsConsistencyScore AS INT)) AS ConsistencyScore
FROM hvbp_hcahps_base HHB
FULL JOIN SurveyResults_tmp SRT;

DROP TABLE SurveyResults_tmp;
