#!/bin/bash

# MICROSERVICES CONFIGURATION PARAMETERS
pkg=APP_SERVICES
bootstrap="appMicroServicesBootstrap.sh"

gitRepo="linux-scripts-app-services"
installDir="/tmp/scripts/utils/$pkg"
appServicesDir=/etc/init.d
daemon=apps
appProcessDir=$appServicesDir/appProcesses

# Set Up testApps service
testApp="$springBootHelloWorldDemo-0.1.0.jar"
testServicesDir=$appProcessDir/test
testServicesScriptsDir=$testServicesDir/scripts
testServicesProgramsDir=$testServicesDir/programs
testServicesJarsDir=$testServicesPrograms/jars

testDownloadDir="$installDir/installs/test"
