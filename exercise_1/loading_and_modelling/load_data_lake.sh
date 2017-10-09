#! /bin/bash
echo "Creating directory /user/w205/exercise_1/"
hdfs dfs -mkdir /user/w205/exercise_2

echo "Creating directory /user/w205/hospital_general_information/"
hdfs dfs -mkdir /user/w205/exercise_1/hospital_general_information

echo "Putting hospital_general_information.csv to HDFS"
hdfs dfs -put /home/w205/hospital_compare/hospital_general_information.csv /user/w205/exercise_1/hospital_general_information

echo "Creating directory /user/w205/hvbp_hcahps/"
hdfs dfs -mkdir /user/w205/exercise_1/hvbp_hcahps

echo "Putting hospital_general_information.csv to HDFS"
hdfs dfs -put /home/w205/hospital_compare/hvbp_hcahps_05_28_2015.csv /user/w205/exercise_1/hvbp_hcahps

echo "Creating directory /user/w205/measure_dates/"
hdfs dfs -mkdir /user/w205/exercise_1/measure_dates

echo "Putting measure_dates.csv  to HDFS"
hdfs dfs -put /home/w205/hospital_compare/measure_dates.csv /user/w205/exercise_1/measure_dates

echo "Creating directory /user/w205/readmissions_and_deaths/"
hdfs dfs -mkdir /user/w205/exercise_1/readmissions_and_deaths

echo "Putting readmissions_and_deaths.csv to HDFS"
hdfs dfs -put /home/w205/hospital_compare/readmissions_and_deaths.csv /user/w205/exercise_1/readmissions_and_deaths

echo "Creating directory /user/w205/readmissions_and_deaths/"
hdfs dfs -mkdir /user/w205/exercise_1/timely_and_effective_care

echo "Putting timely_and_effective_care.csv to HDFS"
hdfs dfs -put /home/w205/hospital_compare/timely_and_effective_care.csv /user/w205/exercise_1/timely_and_effective_care

