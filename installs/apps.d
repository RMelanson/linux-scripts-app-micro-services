#!/bin/bash
# chkconfig: 2345 20 80
# description: appServices ~ Start an Application as a Services
# process Name: start
# pidDir: /etc/init.d/servives
# Author: Robin Melanson (Contractor)
# Contact: robin.e.melanson@gmail.com

args="$*"
noArgs=$#
servicesDir=/etc/init.d/services
pidDir=$servicesDir/ids
logDir=$servicesDir/logs
testScripts=$servicesDir/test/scripts/*

processType=null;

isNumber() {
  parms=$1
  nums='^[0-9]+$'
  if [[ $parms =~ $nums ]]
  then
     return 0
  else
     return 1
  fi
}

selectAll() {
  parms=$1
  if [ "${parms^^}" == "ALL" ]
  then
     return 0
  else
     return 1
  fi
}

isNull() {
   if [ ! -z $1 ]
   then
      return 1
   else
      return 0
   fi
}

runningPID() {
   pid=$1
   systemPIDs=$(ps -A -o pid)
   if [[ $systemPIDs == *"$pid"* ]]
   then
      return 1
   else
      return 0
   fi
}

setProcessType() {
   if isNull $1
    then
       processType="NULL"
       echo "is NULL";
   elif isNumber $1
   then
       processType="PID"
       echo "is PID";
   elif selectAll $1
   then
       processType="ALL"
       echo "Process ALL"
   else
       processType="JOB"
       echo "Process job"
   fi
}

setLogFile(){
   logfile=$logDir/$(date +"%y-%m-%d").log
}

echoLog() {
   setLogFile
   parms="$*"
   tm=$(date +"%H:%M:%S>")
   tmParms=$tm$parms
   echo $tmParms | tee -a $logfile
}

log() {
   echo $1 >> $logfile
}

usage() {
   if [ ! -z $1 ]
   then
     echoLog $1
   fi
   echo "=============================USAGE================================"
   echo $"Usage: $0 {start|stop|restart|clean|status|help}"
}

about() {
   clear;
   echoLog "======================= ABOUT APPS SERVICES =========================="
   echo "# description: $prog ~ Add Applications as a Services"
   echo "# processname: $prog"
   echo "# Author     : Robin Melanson (Contractor)"
   echo "# Contact    : robin.e.melanson@gmail.com"
   usage
}

help () {
   about
   echoLog;
   echo "====================  APPS SERVICES HELP MENU ========================"
   echo "Usage(1): service $prog start <cmd (Optional)>"
   echo "             The application as a services will be started"
   echo "Usage(2): service $prog stop"
   echo "             The $prog service will be stopped"
   echo "Usage(3): service $prog restart"
   echo "             The $prog services will be restarted"
   echo "             This is accomplished through starting"
   echo "             and stopping the appService app"
   echo "Usage(4): service $prog * <prog Name>"
   echo "             Prints out the appService usage syntax"
   echo "======================================================================"
}

test() {
   testDir="$*"
   for f in $testDir
   do
      echoLog  "Starting Test File $f"
      script=$(cat $f)
      start "$script"
   done
}

startJOB()
{
    job=$*
    $job &
    pid=$!;
    echoLog "start($1) EXECUTING: echo $job &";
    echo $procs > $pidDir/$pid;
}

processPIDs() {
  serviceType="${1^^}"
  # Concatinate Args
  servicePids=$(echo $args | cut -d " " -f2-)
  #Remove Functions Call Name
  servicePids=${servicePids//$1/}
  echoLog  "EXECUTING processPIDs $serviceType $servicePids";
  for pid in $servicePids
  do
     pid="$(basename -- $pid)"
     absPID="$pidDir/$pid"
     echoLog  "EXECUTING $serviceType process $pid";
     case "$serviceType" in
           CLEAN)
                 if runningPID $pid
                 then
                    echoLog  "removing dead process $pid $(cat $absPID)";
                    rm $absPID;
                 else
                    echoLog  "PID $pid is running";
                 fi
                 ;;
           DELETE)
                 ;;
           START)
                 if runningPID $pid
                 then
                    echoLog "Cannot Start $pid is already running";
                 else
                    job=$(cat $absPID);
                    startJOB $job;
                    echoLog "Starting PID $pid is already running";
                 fi
                 ;;
          STOP)
                 if runningPID $pid
                 then
                    echoLog "Killing Process $pid : $(cat $absPID)";
                    kill -9 "$pid"
                  else
                    echoLog "Process $pid *NOT* Running: $(cat $absPID)";
                  fi
                 ;;
           STATUS)
                 if runningPID $pid
                 then
                    echoLog "Running Process $pid Found: $(cat $absPID)";
                 else
                    echoLog "Process $pid *NOT* Running: $(cat $absPID)";
                 fi
                 ;;
           *) usage
             exit 1
             ;;
         esac
  done
}

### main logic ###
mode="${1^^}"
echoLog "<======== Executing service apps $args ========>"
# Concatinate Args
serviceParms=$(echo $args | cut -d " " -f2-)
#Remove Functions Call Name
serviceParms=${serviceParms//$1/}
# Get the Service Process Type
setProcessType $serviceParms;

if [ "$serviceType" == "ALL" ]
then
   serviceParms="$pidDir"/*;
fi

case "$serviceType" in
    ALL|PID)
then
   case "$mode" in
        HELP|USAGE|ABOUT|?)
              help
        ;;
        CLEAN|DELETE|RESTART|RELOAD|START|STATUS|STOP)
             processPIDs $mode $serviceParms
        ;;
        TEST)
              usage "Undefined Parameters $testScripts";
        ;;
       *) usage
              exit 1
        ;;
   esac
   ;;
   NULL)
   case "$mode" in
        STATUS)
           status $serviceParms;
        ;;
        TEST)
           test $testScripts;
        ;;
       *) usage
          exit 1
   esac
   ;;
   JOB)
    echoLog "Starting Services $procs"
       startJOB $procs;
    ;;
esac

exit 0
