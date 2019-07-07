#! /bin/bash
# SETUP THE REQUIRED ENVIRONMENTTapps
echo addCIServices.sh EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

#INSTALL $daemon AS AN init.d SERVICE

echo addCIServices.sh Set $daemon as an Cloud Initialiser service

# INSTALL JAVA APPS DAEMON TO SERVER
echo addCIServices.sh EXECUTING: cp ./installs/$daemon.d $ciBin/$daemon
echo y | cp ./installs/$daemon.d $ciBin/$daemon

# CREATE SYMBOLIC LINK FOR APPS SERVICES
echo addCIServices.sh EXECUTING: rm /sbin/$daemon
rm /sbin/$daemon
echo addCIServices.sh EXECUTING: ln -s  /sbin/$daemon $ciBin/$daemon
ln -s  $ciBin/$daemon /sbin/$daemon

echo addCIServices.sh EXECUTING: chmod 755 $sbin/$daemon
chmod 755 $sbin/$daemon

# CREATE PROCESS DIRECTORY
echo addCIServices.sh EXECUTING: cp -rf $installDir/servicesDir $servicesDir
cp -rf $installDir/services/* $servicesDir

# CREATE PROCESS IDs DIRECTORY
echo addCIServices.sh EXECUTING: mkdir $programIds
mkdir $programIds

# ADD apps TEST SERVICES SCRIPTS DIRECTORY
echo addCIServices.sh EXECUTING: mkdir $testServicesScriptsDir
mkdir -p $testServicesScriptsDir

echo addCIServices.sh EXECUTING: chmod -R 755 $servicesDir
chmod -R 755 $servicesDir
