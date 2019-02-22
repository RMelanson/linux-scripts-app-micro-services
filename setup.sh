#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# INSTALL REQUIRED DEVELOPMENT LIBRARIES
./install/installJava8.sh

# INSTALL STOCK WIDGETS TEST DATA
./install/bootstraps/swTestDataBootstrap.sh

java -jar $swAPI_Jar &
