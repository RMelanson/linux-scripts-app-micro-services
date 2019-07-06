#!/bin/bash

# LINUX SCRIPTS CONFIGURATION PARAMETERS
bootstrap="appServicesBootStrap.sh"
gitRepo="linux-scripts-app-services"

#SET UP INSTALLATION DIRECTORY
pkg=APP_SERVICES
scriptType="utils"
parentDir="/tmp/scripts/$scriptType"
pkgDir="$parentDir/$pkg"
installDir="$pkgDir/installs"

#appServicesDir=/etc/init.d
ciDir=/opt/CI
ciBin=$appServiceDir/bin
daemon=/cloudInit
servicesDir=$ciDir/services

# Set Up testApps service
testApp="springBootHelloWorldDemo-0.1.0.jar"

testServicesDir=$servicesDir/test
programIds=$servicesDir/ids
testServicesScriptsDir=$testServicesDir/scripts
testServicesJarsDir=$testServicesDir/jars

testDownloadDir="$installDir/installs/test"
