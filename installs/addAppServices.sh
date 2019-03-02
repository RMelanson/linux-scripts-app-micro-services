#Set appServices.d as an init.d service
echo y|cp -rf installs/appServices.d /etc/init.d/appServices.d
chkconfig appServices.d on
service appServices.d start
