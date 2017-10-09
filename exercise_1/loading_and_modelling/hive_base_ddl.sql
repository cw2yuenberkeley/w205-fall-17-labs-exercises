DROP TABLE hospital_base;
CREATE EXTERNAL TABLE IF NOT EXISTS hospital_base
(
        ProviderID STRING,
        HospitalName STRING,
        Address STRING,
        City STRING,
        State STRING,
        ZIPCode STRING,
        CountyName STRING,
        PhoneNumber STRING,
        HospitalType STRING,
        HospitalOwnership STRING,
        EmergencyServices BOOLEAN
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES 
("separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' ) 
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hospital_general_information';


DROP TABLE hvbp_hcahps_base;
CREATE EXTERNAL TABLE IF NOT EXISTS hvbp_hcahps_base
(
        ProviderID STRING,
        HospitalName STRING,
        Address STRING,
        City STRING,
        State STRING,
        ZipCode STRING,
        CountyName STRING,
        CommunicationwithNursesAchievementPoints STRING,
        CommunicationWithNursesImprovementPoints STRING,
        CommunicationWithNursesDimensionScore STRING,
        CommunicationWithDoctorsAchievementPoints STRING,
        CommunicationWithDoctorsImprovementPoints STRING,
        CommunicationWithDoctorsDimensionScore STRING,
        ResponsivenessOfHospitalStaffAchievementPoints STRING,
        ResponsivenessOfHospitalStaffImprovementPoints STRING,
        ResponsivenessOfHospitalStaffDimensionScore STRING,
        PainManagementAchievementPoints STRING,
        PainManagementImprovementPoints STRING,
        PainManagementDimensionScore STRING,
        CommunicationAboutMedicinesAchievementPoints STRING,
        CommunicationAboutMedicinesImprovementPoints STRING,
        CommunicationAboutMedicinesDimensionScore STRING,
        CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints STRING,
        CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints STRING,
        CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore STRING,
        DischargeInformationAchievementPoints STRING,
        DischargeInformationImprovementPoints STRING,
        DischargeInformationDimensionScore STRING,
        OverallRatingOfHospitalAchievementPoints STRING,
        OverallRatingOfHospitalImprovementPoints STRING,
        OverallRatingOfHospitalDimensionScore STRING,
        HcahpsBaseScore INT,
        HcahpsConsistencyScore INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/hvbp_hcahps';


DROP TABLE measure_dates_base;
CREATE EXTERNAL TABLE IF NOT EXISTS measure_dates_base
(
        MeasureName STRING,
        MeasureID STRING,
        MeasureStartQuarter STRING,
        MeasureStartDate DATE,
        MeasureEndQuarter STRING,
        MeasureEndDate DATE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/measure_dates';


DROP TABLE readmissions_and_deaths_base;
CREATE EXTERNAL TABLE IF NOT EXISTS readmissions_and_deaths_base
(
        ProviderID STRING,
        HospitalName STRING,
        Address STRING,
        City STRING,
        State STRING,
        ZIPCode STRING,
        CountyName STRING,
        PhoneNumber STRING,
        MeasureName STRING,
        MeasureID STRING,
        ComparedToNational STRING,
        Denominator INT,
        Score FLOAT,
        LowerEstimate FLOAT,
        HigherEstimate FLOAT,
        Footnote STRING,
        MeasureStartDate Date,
        MeasureEndDate Date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/readmissions_and_deaths';

DROP TABLE timely_and_effective_care_base;
CREATE EXTERNAL TABLE IF NOT EXISTS timely_and_effective_care_base
(
        ProviderID STRING,
        HospitalName STRING,
        Address STRING,
        City STRING,
        State STRING,
        ZIPCode STRING,
        CountyName STRING,
        PhoneNumber STRING,
        Condition STRING,
        MeasureID STRING,
        MeasureName STRING,
        Score INT,
        Sample INT,
        Footnote STRING,
        MeasureStartDate DATE,
        MeasureEndDate DATE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" = '"', "escapChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/exercise_1/timely_and_effective_care';
