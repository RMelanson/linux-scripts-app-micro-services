#!/bin/bash

# LINUX SCRIPTS CONFIGURATION PARAMETERS
bootstrap="appMicroServicesBootstrap.sh"
gitRepo="linux-scripts-app-services"

#SET UP INSTALLATION DIRECTORY
pkg=APP_SERVICES
scriptType="utils"
parentDir="/tmp/scripts/$scriptType/"
installDir="$parentDir/$pkg"

appServicesDir=/etc/init.d
daemon=apps
appProcessDir=$appServicesDir/appProcesses

# Set Up testApps service
testApp="springBootHelloWorldDemo-0.1.0.jar"

testServicesDir=$appProcessDir/test
testServicesScriptsDir=$testServicesDir/scripts
testServicesProgramsDir=$testServicesDir/programs
testServicesJarsDir=$testServicesProgramsDir/jars

testDownloadDir="$installDir/installs/test"
