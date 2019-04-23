#! /bin/bash
setupName=setup.sh:
# SETUP THE REQUIRED ENVIRONMENTt
echo setup.sh: EXECUTING ./env/setEnv.sh
. ./env/setEnv.sh

# COPY RESTORE 
cp $pkg_RESTORE.sh ..

#INSTALL JAVA 8
echo Setup.sh:  EXECUTING . ./installs/installJava8.sh
. ./installs/installJava8.sh

# CREATE SERVICE APPLICATION DIRECTORY
echo $setupName EXECUTING mkdir -p $appProcessDir
mkdir -p $appProcessDir
cp -rf ./test $appProcessDir

# INSTALL $daemon AS A SERVICE
echo BEFORE $setupName EXECUTING service $daemon start $testApp
echo $setupName EXECUTING . ./installs/addAppServices.sh
. ./installs/addAppServices.sh

#TURN ON $daemon DAEMON
echo $scriptName EXECUTING chkconfig $daemon on
chkconfig $daemon on
