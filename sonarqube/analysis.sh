#!/bin/bash

#====================================================================================================
#  Script to check sonarqube analysis status
#====================================================================================================   
   
SONARQUBE_URL=sonarqube.devops.ruby.com:9000
QGSTATUS=$(curl -s -u $SONAR_TOKEN: $SONARQUBE_URL/api/qualitygates/project_status?projectKey=$SONAR_PROJECT_KEY | jq .projectStatus.status)
if [ "$QGSTATUS" = "OK" ] 
then 
  echo "Sonar scanning has successfully ended with the status 'OK'" 
elif [ "$QGSTATUS" = "WARN" ] 
then  
  echo "Status is WARN. Check out the quality of the products at $SONARQUBE_URL:9000" 
elif [ "$QGSTATUS" = "ERROR" ] 
then
 echo "Status is ERROR. Check out the quality of the products at $SONARQUBE_URL:9000" 
 exit 1
fi