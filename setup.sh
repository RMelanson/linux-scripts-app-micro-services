#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# CREATE SERVICE APPLICATION DIRECTORY
mkdir -p $appProcessDir

# INSTALL JAVA APPS TO SERVER
cp ./installs/appServices.d $appServicesDir
chmod 766 $appServicesDir/$prog

# INSTALL SWAPIs as a SERVICE
./installs/addAppServices.sh
