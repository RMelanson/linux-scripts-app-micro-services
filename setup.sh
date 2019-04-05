#! /bin/bash
setupName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo setup.sh: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# CREATE SERVICE APPLICATION DIRECTORY
echo $setupName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir

# INSTALL $daemon as a SERVICE DEAMON
echo BEFORE $setupName EXECUTING service $daemon start $testApp
echo $setupName EXECUTING . ./installs/addAppServices.sh
. ./installs/addAppServices.sh

# INSTALL TEST APP as a SERVICE (uncomment to test)
echo $setupName EXECUTING . ./installs/testBootStrapAppServer
. ./installs/testBootStrapAppServer
