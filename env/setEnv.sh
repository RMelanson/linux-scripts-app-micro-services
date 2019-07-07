#!/bin/bash

# LINUX SCRIPTS CONFIGURATION PARAMETERS
bootstrap="appServicesBootStrap.sh"
gitRepo="linux-scripts-app-services"

# SET UP INSTALLATION DIRECTORY
pkg=APP_SERVICES
scriptType="utils"
parentDir="/tmp/scripts/$scriptType"
pkgDir="$parentDir/$pkg"
installDir="$pkgDir/installs"

# SET UP CLOUD INITIALISER PROGRAM DIRECTORY
ciDir=/opt/CI
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
