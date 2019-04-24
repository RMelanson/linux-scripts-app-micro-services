#! /bin/bash
setupName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo setup.sh: EXECUTING: ./env/setEnv.sh
. ./env/setEnv.sh

# COPY RESTORE 
cp $pkg_RESTORE.sh ..

echo $setupName EXECUTING" chmod 744 $appServicesDir

# SETUP RECOVERY
cp $reinstall.sh/reinstall.sh $parentDir

# INSTALL $daemon AS A SERVICE
echo $setupName EXECUTING: . ./installs/addAppServices.sh
. ./installs/addAppServices.sh

#TURN ON $daemon DAEMON
echo $scriptName EXECUTING: chkconfig $daemon on
chkconfig $daemon on
