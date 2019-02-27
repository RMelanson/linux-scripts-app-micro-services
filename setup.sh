#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# INSTALL REQUIRED DEVELOPMENT LIBRARIES
./install/installJava8.sh

# INSTALL STOCK WIDGETS TEST DATA
./install/bootstraps/swTestDataBootstrap.sh

# SET UP LINUX ADMIN USER
./install/addLinuxUser.sh $wfOwner $wfGroup $wfHome $pkg

# CREATE SERVICE APPLICATION DIRECTORY
mkdir -p $appDir

# INSTALL JAVA APPS TO SERVER
cp ./jars/* $appDir

# INSTALL JAVA APPS TO SERVER
chown -R $ownr:$group $serviceDir

# INSTALL SWAPIs SERVICE
./installs/addSwAPIsAsService.sh
