#! /bin/bash
scriptName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $scriptName EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# CREATE SERVICE APPLICATION DIRECTORY
echo $scriptName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir

# INSTALL JAVA APPS TO SERVER
echo $scriptName EXECUTING cp ./installs/appServices.d $appServicesDir
cp ./installs/appServices.d $appServicesDir/$prog
chmod 766 $appServicesDir/$prog

# INSTALL SWAPIs as a SERVICE
echo $scriptName EXECUTING ./installs/addAppServices.sh
./installs/addAppServices.sh
