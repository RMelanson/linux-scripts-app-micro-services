#Set appServices.d as an init.d service
echo y|cp -rf installs/appServices.d $appServicesDir$prog
chkconfig $prog on
service $prog start
