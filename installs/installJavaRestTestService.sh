#! /bin/bash
setupName=testBootStrapAppServer.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo setup.sh: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

#INSTALL JAVA 8
echo Setup.sh:  EXECUTING . ./installs/installJava8.sh
. ./installs/installJava8.sh

# INSTALL TEST APP as a SERVICE
echo $setupName EXECUTING service $daemon start $testApp
service $daemon start $testApp
