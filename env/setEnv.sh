#!/bin/bash

# MICROSERVICES CONFIGURATION PARAMETERS
pkg=APP_SERVICES
bootstrap="appMicroServicesBootstrap.sh"

gitRepo="linux-scripts-app-services"
installDir="/tmp/scripts/utils/$pkg"
appServicesDir=/etc/init.d
daemon=apps
appProcessDir=$appServicesDir/appProcesses
testServicesDir=$appProcessDir/test
testServicesScripts=$testServicesDir/scripts
testServicesPrograms=$testServicesDir/programs
testServicesJars=$testServicesPrograms/jars

testDownloadDir="$installDir/installs/test"

testApp="$testServicesJars/springBootHelloWorldDemo-0.1.0.jar"
