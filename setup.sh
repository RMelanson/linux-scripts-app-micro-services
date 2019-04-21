#! /bin/bash
setupName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo setup.sh: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

#INSTALL JAVA 8
echo Setup.sh:  EXECUTING . ./installs/installJava8.sh
. ./installs/installJava8.sh

# CREATE SERVICE APPLICATION DIRECTORY
echo $setupName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir
cp -rf ./test $appProcessDir

# INSTALL $daemon as a SERVICE DEAMON
echo BEFORE $setupName EXECUTING service $daemon start $testApp
echo $setupName EXECUTING . ./installs/addAppServices.sh
. ./installs/addAppServices.sh

# INSTALL TEST APP SERVICES
echo $setupName To Test EXECUTE . ./installs/linux-scripts-app-services
. ./installs/linux-scripts-app-services
