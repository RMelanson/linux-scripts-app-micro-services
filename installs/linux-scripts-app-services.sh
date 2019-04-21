#! /bin/bash
setupName=testBootStrapAppServer.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $setupName: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

echo $setupName: EXECUTING mkdir $testServicesScripts
mkdir -p $testServicesScripts

echo $setupName: EXECUTING mkdir $testServicesJars
mkdir -p $testServicesJars

echo $setupName: EXECUTING mkdir $testServicesJars
cp $testApp $testServicesJars

echo $setupName: EXECUTING mkdir $testServicesJars
echo "java - jar $testServicesJars/springBootHelloWorldDemo-0.1.0.jar" > $testServicesScripts/springBootHelloWorldDemo-0.1.0.sh
