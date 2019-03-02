#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# CREATE SERVICE APPLICATION DIRECTORY
mkdir -p $appDir

# INSTALL JAVA APPS TO SERVER
cp ./jars/* $appDir

# INSTALL SWAPIs as a SERVICE
./installs/addAppServices.sh
