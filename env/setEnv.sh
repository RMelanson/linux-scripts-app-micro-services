#!/bin/bash

# LINUX SCRIPTS CONFIGURATION PARAMETERS
bootstrap="/cloudInitializerBootStrap.sh"
gitRepo="/cloudInitializerBootStrap."

# SET UP INSTALLATION DIRECTORY
pkg=APP_SERVICES
scriptType="apps"
parentDir="/opt/CI/bootstraps/$scriptType"
pkgDir="$parentDir/$pkg"
installDir="$pkgDir/installs"

# SET UP CLOUD INITIALIZER PROGRAM DIRECTORY
ciAdmin=root
ciParentDir=/opt
ciBin=$ciDir/bin
ciScripts=$ciBin/scripts
ciBashScripts=$ciScripts/bash
ciDir=/$ciParentDir/CI
cilogs=$ciDir/logs
ciExeJar=$ciBin/java/libs/cloud-initializer-0.1.0.jar
daemon=cloudinit
servicesDir=$ciDir/services

appServicesDir=$ciDir/services
servicesDir=$appServicesDir/services
jobsDir=$servicesDir/jobs/$scriptType/$progType
serverPort="-Dserver.port=9090"

HTML_HOME=/var/www/html

pkgOwner=ec2-user

echo Setting External Args
echo These Arguments Overwrite Default Argument Settings
for arg in "$@"; do
  echo setArgs EXECUTING: export $arg
  export $arg
done
