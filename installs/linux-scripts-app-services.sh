#! /bin/bash
setupName=linux-scripts-app-services.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $setupName: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

echo $setupName: EXECUTING mkdir $testServicesDir
mkdir -p $testServicesDir

echo $setupName: EXECUTING echo "java - jar $testServicesJarsDir/$testApp" > $testServicesScriptsDir/springBootHelloWorldDemo-0.1.0.
echo "java - jar $testServicesJarsDir/$testApp" > $testServicesScriptsDir/springBootHelloWorldDemo-0.1.0.sh
