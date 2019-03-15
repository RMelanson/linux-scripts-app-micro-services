#!/bin/bash

# MICROSERVICES CONFIGURATION PARAMETERS
pkg=appServices
gitRepo="linux-scripts-app-services"
installDir="/tmp/scripts/utils/appServices"
appServicesDir=/etc/init.d
appProcessDir=$appServicesDir/appProcesses
daemon=appServices.d
testApp=" java -jar $appProcessDir/springBootHelloWorldDemo-0.1.0.jar"
