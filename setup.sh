#! /bin/bash
scriptName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $scriptName EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# CREATE SERVICE APPLICATION DIRECTORY
echo $scriptName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir

# INSTALL JAVA APPS TO SERVER
echo $scriptName EXECUTING cp ./installs/appServices.d $appServicesDir$daemon
cp ./installs/appServices.d $appServicesDir$daemon
chmod 766 $appServicesDir$daemon

# INSTALL SWAPIs as a SERVICE
echo $scriptName EXECUTING ./installs/addAppServices.sh
. ./installs/addAppServices.sh
