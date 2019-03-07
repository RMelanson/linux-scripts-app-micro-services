#! /bin/bash
scriptName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $scriptName EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# CREATE SERVICE APPLICATION DIRECTORY
echo $scriptName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir

# INSTALL JAVA APPS TO SERVER
echo $scriptName EXECUTING cp ./installs/appServices.d $appServicesDir/$daemon
cp ./installs/appServices.d $appServicesDir/$daemon
chmod 766 $appServicesDir/$daemon

# COPY SAMPLE TEST PROGRAM
echo $scriptName EXECUTING cp ./jars/springBootHelloWorldDemo-0.1.0.jar $appProcessDir
cp ./jars/springBootHelloWorldDemo-0.1.0.jar $appProcessDir

# INSTALL $daemon as a SERVICE DEAMON
echo BEFORE $scriptName EXECUTING service $daemon start $testApp
echo $scriptName EXECUTING ./installs/addAppServices.sh
. ./installs/addAppServices.sh

# INSTALL TEST APP as a SERVICE
echo AFTER $scriptName EXECUTING service $daemon start $testApp
service $daemon start $testApp
