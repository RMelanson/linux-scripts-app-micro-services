#Set swAPIs as an init.d service
echo y|cp -rf swAPIs.d /etc/init.d/swAPIs
echo y|cp -rf s3fsMounts /etc/init.d/s3fsMounts
chkconfig swAPIs on
service swAPIs start
