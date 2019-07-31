#! /bin/bash
# SETUP THE REQUIRED ENVIRONMENTTapps
echo addCIServices.sh EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# INSTALL JAVA APPS DAEMON TO SERVER
echo addCIServices.sh EXECUTING: "echo y | cp -rf ./installs/CI $ciParentDir"
echo y | cp -rf ./installs/CI $ciParentDir

# CHANGE OWNER AND GROUP of all Files in $ciParentDir to $pkgOwner
echo addCIServices.sh EXECUTING: "chown -R $pkgOwner:$pkgOwner $ciParentDir/CI"
chown -R $pkgOwner:$pkgOwner $ciParentDir/CI

# INSTALL HTTP WEB CODE TO SERVER
echo addCIServices.sh EXECUTING: "echo y | cp -rf ./installs/webapp $HTML_HOME"
echo y | cp -rf ./installs/webapp/* $HTML_HOME

# CHANGE OWNER AND GROUP of all Files in $HTML_HOME to $pkgOwner
echo addCIServices.sh EXECUTING: "chown -R $pkgOwner:$pkgOwner $HTML_HOME/cloudinitialiser"
echo addCIServices.sh EXECUTING: "chown -R $pkgOwner:$pkgOwner $HTML_HOME/ci"
echo addCIServices.sh EXECUTING: "chown -R $pkgOwner:$pkgOwner $HTML_HOME/cm"
echo addCIServices.sh EXECUTING: "chown -R $pkgOwner:$pkgOwner $HTML_HOME/index"
chown -R $pkgOwner:$pkgOwner $HTML_HOME/cloudinitialiser
chown -R $pkgOwner:$pkgOwner $HTML_HOME/ci
chown -R $pkgOwner:$pkgOwner $HTML_HOME/cm
chown -R $pkgOwner:$pkgOwner $HTML_HOME/index

# REMOVE OLD CLOUD INITIALISER DAEMON
echo addCIServices.sh EXECUTING: rm /sbin/$daemon
rm /sbin/$daemon

# CREATE SYMBOLIC LINK FOR APPS SERVICES
echo addCIServices.sh EXECUTING: ln -s  /sbin/$daemon.d $ciBin/$daemon
ln -s  $ciBin/$daemon.d /sbin/$daemon

echo addCIServices.sh EXECUTING: chmod 755 $sbin/$daemon $ciBin/$daemon.d
chmod 755 $sbin/$daemon $ciBin/$daemon.d

echo addCIServices.sh EXECUTING: chmod -R 755 $servicesDir
chmod -R 755 $servicesDir
