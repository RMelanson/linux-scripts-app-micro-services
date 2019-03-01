#Set swAPIs as an init.d service
echo y|cp -rf swAPIs.d /etc/init.d/swAPIs
chkconfig swAPIs on
service swAPIs start
