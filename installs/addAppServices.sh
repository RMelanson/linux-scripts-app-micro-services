#! /bin/bash
# SETUP THE REQUIRED ENVIRONMENTT
echo $setupName: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

#INSTALL $daemon AS AN init.d SERVICE
scriptName=addAppServices.sh

echo $scriptName Set $daemon as an init.d service

# INSTALL JAVA APPS DAEMON TO SERVER
echo $setupName EXECUTING cp ./installs/$daemon.d $appServicesDir/$daemon
echo y | cp ./installs/$daemon.d $appServicesDir/$daemon

echo $setupName EXECUTING chmod 766 $appServicesDir/$daemon
chmod 766 $appServicesDir/$daemon

# CREATE PROCESS DIRECTORY
echo $setupName EXECUTING: cp -rf $installDir/appProcs $appProcessDir
cp -rf $installDir/appProcs $appProcessDir

# CREATE PROCESS IDs DIRECTORY
echo $setupName EXECUTING: mkdir $programIds
mkdir $programIds

# ADD apps TEST SERVICES SCRIPTS DIRECTORY
echo $setupName EXECUTING: mkdir $testServicesScriptsDir
mkdir -p $testServicesScriptsDir

echo $setupName: EXECUTING chmod -R 744 $appProcessDir
chmod -R 744 $appProcessDir
