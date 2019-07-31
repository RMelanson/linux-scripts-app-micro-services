#! /bin/bash
setupName=setup.sh:

# SETUP THE ENVIRONMENT
echo "$setupName: EXECUTING: . ./env/setEnv.sh $*"
. ./env/setEnv.sh $*

#INSTALL JAVA 8
echo $setupName:  EXECUTING: . ./installs/installJava8.sh
. ./installs/installJava8.sh

# SETUP RECOVERY
echo $setupName EXECUTING: . ./installs/addAppServices.sh
. ./installs/setRecovery.sh

# INSTALL $daemon AS A SERVICE
echo $setupName EXECUTING: . ./installs/addCIServices.sh
. ./installs/addCIServices.sh

# COPY Reinstall Methods up a Level
echo $setupName EXECUTING: cp ./reinstall_CI.sh ..
echo $setupName EXECUTING: cp ./cloudInitialiserBootStrap.sh ..
cp ./reinstall_CI.sh ..
cp ./cloudInitialiserBootStrap.sh ..

# START CLOUD_SERVICE SERVICE
echo $setupName EXECUTING: . $ciBin/startCloudInitialiserService.sh
. $ciBin/startCloudInitialiserService.sh
