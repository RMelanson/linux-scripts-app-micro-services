#Set $daemon as an init.d service

scriptName=addAppServices.sh

echo $scriptName Set $daemon as an init.d service

# INSTALL JAVA APPS DAEMON TO SERVER
echo $setupName EXECUTING cp ./installs/$daemon.d $appServicesDir/$daemon
echo y | cp ./installs/$daemon.d $appServicesDir/$daemon

# CREATE PROCESS DIRECTORY
echo $setupName EXECUTING: cp -rf $installDir/appProcs $appProcessDir
cp -rf $installDir/appProcs $appProcessDir

# CREATE PROCESS IDs DIRECTORY
echo $setupName EXECUTING: mkdir $programIds
mkdir $programIds

# ADD apps TEST SERVICES SCRIPTS DIRECTORY
echo $setupName EXECUTING: mkdir $testServicesScriptsDir
mkdir -p $testServicesScriptsDir

echo $setupName EXECUTING chmod 766 $appServicesDir/$daemon
chmod 766 $appServicesDir/$daemon


echo $setupName: EXECUTING echo "java - jar $testServicesJarsDir/$testApp" > $testServicesScriptsDir/springBootHelloWorldDemo-0.1.0.
echo "java -jar $testServicesJarsDir/$testApp" > $testServicesScriptsDir/springBootHelloWorldDemo-0.1.0.sh

#turn on apps DAEMON
echo $scriptName EXECUTING chkconfig $daemon on
chkconfig $daemon on
