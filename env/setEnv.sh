#!/bin/bash

# LINUX SCRIPTS CONFIGURATION PARAMETERS
bootstrap="/cloudInitialiserBootStrap.sh"
gitRepo="/cloudInitialiserBootStrap."

# SET UP INSTALLATION DIRECTORY
pkg=APP_SERVICES
scriptType="apps"
parentDir="/tmp/scripts/$scriptType"
pkgDir="$parentDir/$pkg"
installDir="$pkgDir/installs"

# SET UP CLOUD INITIALISER PROGRAM DIRECTORY
ciParentDir=/opt
ciDir=/$ciParentDir/CI
ciBin=$ciDir/bin
cilogs=$ciDir/logs
daemon=cloudInit
servicesDir=$ciDir/services

ciDir=/opt/CI
appServicesDir=$ciDir/services
servicesDir=$appServicesDir/services
jobsDir=$servicesDir/jobs/$scriptType/$progType
serverPort="-Dserver.port=9090"

HTTP_HOME=/var/www/html
