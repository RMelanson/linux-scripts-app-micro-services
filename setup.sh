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

# ADD Admin and Privledges
echo $setupName EXECUTING: . ./installs/setAdmin.sh
. ./installs/setAdmin.sh

#echo $setupName EXECUTING: cp ./cloudInitializerBootStrap.sh ..
#cp ./cloudInitializerBootStrap.sh ..

echo $setupName EXECUTING: cp .uninstalls_CI.sh ../../uninstalls
cp ./uninstalls.sh ../../uninstalls/uninstall_CI.sh

echo $setupName EXECUTING: cp ./reinstall_CI.sh ../../reinstalls
cp ./reinstall.sh ../../reinstalls/reinstall_CI.sh

# START CLOUD_SERVICE SERVICE
echo $setupName EXECUTING: . $ciBashScripts/startCloudInitializerService.sh
. $ciBashScripts/startCloudInitializerService.sh
