#!/bin/bash

# MICROSERVICES CONFIGURATION PARAMETERS
pkg=APP_SERVICES
bootstrap="appMicroServicesBootstrap.sh.sh"

gitRepo="linux-scripts-app-services"
installDir="/tmp/scripts/utils/$pkg"
appServicesDir=/etc/init.d
appProcessDir=$appServicesDir/appProcesses
testServicesDir=$appProcessDir/test
testServicesScripts=$testServicesDir/scripts
testServicesScripts=$testServicesDir/jars
daemon=apps
testApp="java -jar $testServicesDir/jars/springBootHelloWorldDemo-0.1.0.jar"
