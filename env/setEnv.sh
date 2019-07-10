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
daemon=cloudInit
servicesDir=$ciDir/services

# SET UP TESTAPPS SERVICE
testApp="springBootHelloWorldDemo-0.1.0.jar"

testServicesDir=$servicesDir/test
programIds=$servicesDir/ids
testServicesScriptsDir=$testServicesDir/scripts
testServicesJarsDir=$testServicesDir/jars

testDownloadDir="$installDir/installs/test"

ciDir=/opt/CI
appServicesDir=$CIDir/services
servicesDir=$appServicesDir/services
jobsDir=$servicesDir/jobs/$scriptType/$progType
serverPort="-Dserver.port=9090"

HTTP_HOME=/var/www/html
