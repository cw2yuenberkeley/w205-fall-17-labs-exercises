#! /bin/bash

echo "Transforming Cities table"
hive -f cities_transform.sql

echo "Transforming States table"
hive -f states_transform.sql

echo "Transforming Counties table"
hive -f counties_transform.sql

echo "Transforming HospitalTypes table"
hive -f hospital_types_transform.sql

echo "Transforming HospitalOwnerships table"
hive -f hospital_ownerships_transform.sql

echo "Transforming Hospitals table"
hive -f hospitals_transform.sql

echo "Transforming HospitalSurveys table"
hive -f hospital_surveys_transform.sql

echo "Transforming ProcedureMeasures table"
hive -f procedure_measures_transform.sql

echo "Transforming Procedures table"
hive -f procedsures_transform.sql
