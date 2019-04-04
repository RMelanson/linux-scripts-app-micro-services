#!/bin/bash

# MICROSERVICES CONFIGURATION PARAMETERS
pkg=APP_SERVICES
bootstrap="appMicroServicesBootstrap.sh.sh"

gitRepo="linux-scripts-app-services"
installDir="/tmp/scripts/utils/$pkg"
appServicesDir=/etc/init.d
appProcessDir=$appServicesDir/appProcesses
daemon=appServices.d
testApp="java -jar $installDir/test/jars/springBootHelloWorldDemo-0.1.0.jar"
