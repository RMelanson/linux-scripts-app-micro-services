#! /bin/bash
setupName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo setup.sh: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

sudo yum install java-1.8.0
echo 1 |sudo alternatives --config java

# CREATE SERVICE APPLICATION DIRECTORY
echo $setupName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir

# INSTALL JAVA APPS TO SERVER
echo $setupName EXECUTING cp ./installs/appServices.d $appServicesDir/$daemon
cp ./installs/appServices.d $appServicesDir/$daemon
chmod 766 $appServicesDir/$daemon

# COPY SAMPLE TEST PROGRAM
echo $setupName EXECUTING cp ./jars/springBootHelloWorldDemo-0.1.0.jar $appProcessDir
cp ./jars/springBootHelloWorldDemo-0.1.0.jar $appProcessDir

# INSTALL $daemon as a SERVICE DEAMON
echo BEFORE $setupName EXECUTING service $daemon start $testApp
echo $setupName EXECUTING ./installs/addAppServices.sh
. ./installs/addAppServices.sh

# INSTALL TEST APP as a SERVICE
echo $setupName EXECUTING service $daemon start $testApp
service $daemon start $testApp
