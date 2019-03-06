#! /bin/bash
scriptName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $scriptName EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

echo Here 1 testfile = $testFile

# CREATE SERVICE APPLICATION DIRECTORY
echo $scriptName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir

echo Here 2 testfile = $testFile

# INSTALL JAVA APPS TO SERVER
echo $scriptName EXECUTING cp ./installs/appServices.d $appServicesDir$daemon
cp ./installs/appServices.d $appServicesDir$daemon
chmod 766 $appServicesDir$daemon

echo Here 3 testfile = $testFile

# COPY SAMPLE TEST PROGRAM
echo $scriptName EXECUTING cp ./jars/springBootHelloWorldDemo-0.1.0.jar $appProcessDir
cp ./jars/springBootHelloWorldDemo-0.1.0.jar $appProcessDir

echo Here 4 testfile = $testFile

# INSTALL SWAPIs as a SERVICE
echo $scriptName EXECUTING ./installs/addAppServices.sh
. ./installs/addAppServices.sh

echo Here 5 testfile = $testFile
