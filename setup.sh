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
chown $ownr:$group $appDir

# INSTALL JAVA APPS TO SERVER
cp ./jars/* 

java -jar $swAPI_Jar &

chkconfig --add swAPIs
chkconfig swAPIs on
