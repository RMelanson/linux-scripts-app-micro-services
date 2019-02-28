#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# INSTALL REQUIRED DEVELOPMENT LIBRARIES
./installs/installJava8.sh

# INSTALL STOCK WIDGETS TEST DATA
./installs/bootstraps/swTestDataBootstrap.sh

# SET UP LINUX ADMIN USER
./installs/addLinuxUser.sh $owner $group $home $pkg

# CREATE SERVICE APPLICATION DIRECTORY
mkdir -p $appDir

# INSTALL JAVA APPS TO SERVER
cp ./jars/* $appDir

# INSTALL JAVA APPS TO SERVER
chown -R $ownr:$group $serviceDir

# INSTALL SWAPIs as a SERVICE
./installs/addSwAPIsAsService.sh
