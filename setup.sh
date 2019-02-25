#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# INSTALL REQUIRED DEVELOPMENT LIBRARIES
./install/installJava8.sh

# INSTALL STOCK WIDGETS TEST DATA
./install/bootstraps/swTestDataBootstrap.sh

# SET UP LINUX ADMIN USER
./install/addLinuxUser.sh $wfOwner $wfGroup $wfHome $pkg

java -jar $swAPI_Jar &
