#Set $daemon as an init.d service

scriptName=addAppServices.sh

echo $scriptName Set $daemon as an init.d service
scriptName=addAppServices.sh:

# INSTALL JAVA APPS TO SERVER
echo $setupName EXECUTING cp ./installs/appServices.d $appServicesDir/$daemon
echo y | cp ./installs/appServices.d $appServicesDir/$daemon
chmod 766 $appServicesDir/$daemon

echo $scriptName EXECUTING chkconfig $daemon on
chkconfig $daemon on
