echo "EXECUTING startCloudInitialiserService.sh: $daemon start java $serverPort -jar $appServicesDir/jobs/java/libs/cloud-initialiser-1.3.5.RELEASE.war"
$daemon start java $serverPort -jar $appServicesDir/jobs/java/libs/cloud-initialiser-1.3.5.RELEASE.war
