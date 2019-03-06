#Set $daemon as an init.d service

scriptName=addAppServices.sh

echo $scriptName Set $daemon as an init.d service
scriptName=addAppServices.sh:

echo $scriptName EXECUTING echo y|cp -rf installs/appServices.d $appServicesDir$daemon
echo y|cp -rf installs/appServices.d $appServicesDir$daemon

echo $scriptName EXECUTING chkconfig $daemon on
chkconfig $daemon on

echo $scriptName EXECUTING service $daemon start
service $daemon start
