#! /bin/bash
# SETUP THE REQUIRED ENVIRONMENTTapps
echo $setupName: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

#INSTALL $daemon AS AN init.d SERVICE
scriptName=addCIServices.sh

echo $scriptName Set $daemon as an Cloud Initialiser service

# INSTALL JAVA APPS DAEMON TO SERVER
echo addCIServices.sh EXECUTING: cp ./installs/$daemon.d $ciBin/$daemon
echo y | cp ./installs/$daemon.d $ciBin/$daemon

# CREATE SYMBOLIC LINK FOR APPS SERVICES
echo addCIServices.sh EXECUTING: ln -s  $ciBin/$daemon /sbin/$daemon
ln -s  $ciBin/$daemon /sbin/$daemon

echo addCIServices.sh EXECUTING: chmod 766 $ciBin/$daemon
chmod 766 $ciBin/$daemon

# CREATE PROCESS DIRECTORY
echo addCIServices.sh EXECUTING: cp -rf $installDir/servicesDir $servicesDir
cp -rf $installDir/services/* $servicesDir

# CREATE PROCESS IDs DIRECTORY
echo addCIServices.sh EXECUTING: mkdir $programIds
mkdir $programIds

# ADD apps TEST SERVICES SCRIPTS DIRECTORY
echo addCIServices.sh EXECUTING: mkdir $testServicesScriptsDir
mkdir -p $testServicesScriptsDir

echo addCIServices.sh EXECUTING: chmod -R 744 $servicesDir
chmod -R 755 $servicesDir
