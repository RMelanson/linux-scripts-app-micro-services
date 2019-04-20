#! /bin/bash
setupName=testBootStrapAppServer.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo $setupName: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

echo $setupName: EXECUTING mkdir $testServicesScripts
mkdir $testServicesScripts

echo $setupName: EXECUTING mkdir $testServicesJars
mkdir $testServicesJars

echo $setupName: EXECUTING mkdir $testServicesJars
cp $testApp $testServicesJars

# INSTALL TEST APP SERVICE
echo $setupName EXECUTING service $daemon start $testApp
service $daemon start $testApp
