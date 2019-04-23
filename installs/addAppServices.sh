#Set $daemon as an init.d service

scriptName=addAppServices.sh

echo $scriptName Set $daemon as an init.d service
scriptName=addAppServices.sh:

# INSTALL JAVA APPS TO SERVER
echo $setupName EXECUTING cp ./installs/$daemon.d $appServicesDir/$daemon
echo y | cp ./installs/$daemon.d $appServicesDir/$daemon

echo $setupName EXECUTING chmod 766 $appServicesDir/$daemon
chmod 766 $appServicesDir/$daemon

echo $scriptName EXECUTING chkconfig $daemon on
chkconfig $daemon on
