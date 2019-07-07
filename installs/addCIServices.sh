#! /bin/bash
# SETUP THE REQUIRED ENVIRONMENTTapps
echo addCIServices.sh EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# INSTALL JAVA APPS DAEMON TO SERVER
echo addCIServices.sh EXECUTING: cp -rf ./installs/CI $ciBin
echo y | cp -rf ./installs/CI $ciBin

# REMOVE OLD CLOUD INITIALISER DAEMON
echo addCIServices.sh EXECUTING: rm /sbin/$daemon
rm /sbin/$daemon

# CREATE SYMBOLIC LINK FOR APPS SERVICES
echo addCIServices.sh EXECUTING: ln -s  /sbin/$daemon $ciBin/$daemon
ln -s  $ciBin/$daemon /sbin/$daemon

echo addCIServices.sh EXECUTING: chmod 755 $sbin/$daemon
chmod 755 $sbin/$daemon

echo addCIServices.sh EXECUTING: chmod -R 755 $servicesDir
chmod -R 755 $servicesDir
