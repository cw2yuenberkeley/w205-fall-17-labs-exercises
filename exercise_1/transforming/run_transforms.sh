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

echo "Transforming SurveyResults table"
hive -f survey_results_transform.sql

echo "Transforming HospitalProcedureResults table"
hive -f hospital_procedure_results_transform.sql

echo "Transforming Procedures table"
hive -f procedures_transform.sql
