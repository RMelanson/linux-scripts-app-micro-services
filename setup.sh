#! /bin/bash
# Setup the required environment
. ./env/setEnv.sh

# INSTALL REQUIRED DEVELOPMENT LIBRARIES
./install/installJava8.sh

java -jar ./jars/gs-spring-boot-0.1.0.jar &
