#Set $prog as an init.d service

echo $scriptName Set $prog as an init.d service
scriptName=addAppServices.sh:

echo $scriptName EXECUTING echo y|cp -rf installs/appServices.d $appServicesDir$prog
echo y|cp -rf installs/appServices.d $appServicesDir$prog

echo $scriptName EXECUTING chkconfig $prog on
chkconfig $prog on

echo $scriptName EXECUTING service $prog start
service $prog start
