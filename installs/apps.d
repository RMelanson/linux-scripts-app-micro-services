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

isAll() {
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

setProcessType() {
   if isNull $1
    then
       processType="NULL"
       echo "is NULL";
   elif isNumber $1
   then
       processType="PID"
       echo "is PID";
   elif isAll $1
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

clean() {
   pidList=$(ps -A -o pid)

   for absPID in "$pidDir"/*
   do
     pid=$(basename -- $absPID)
     if [[ ! $pidList == *"$pid"* ]]; then
        echoLog  "removing dead process $pid $(cat $absPID)";
        rm $absPID;
     else
        echoLog  "PID $pid is running";
     fi
   done
}

delete() {
   procs="$*"
   pidList=$(ps -A -o pid)
   for proc in "$procs"
   do
     pid=$(basename -- $proc)
     echoLog  "Stopping process $pid";
     if [[ $pidList == *"$pid"* ]]; then
        kill -9 $proc;
     fi
     absPID=pidDir/$pid;
     if [ -f "$absPID" ]; then
          echoLog  "removing dead process $pid $(cat $absPID)";
     fi
   done
}

deleteAll() {
  pidList=$(ps -A -o pid)
  for absPID in $pidDir/*
  do
     pid="$(basename -- $absPID)"
     if [[ $pidList == *"$pid"* ]]; then
        echoLog  "stopping process $pid $(cat $absPID)";
        kill -9 "$pid"
     fi
  done
}

stop() {
   procs="$*"
if [ "${procs^^}" == "ALL" ]; then
    echoLog "Stopping All services"
else
    echo "Stopping Services $procs"
fi

   pidList=$(ps -A -o pid)
   for proc in "$procs"
   do
     pid=$(basename -- $proc)
     echoLog  "Stopping process $pid";
     if [[ $pidList == *"$pid"* ]]; then
        kill -9 $proc;
     fi
     absPID=pidDir/$pid;
     if [ -f "$absPID" ]; then
          echoLog  "removing dead process $pid $(cat $absPID)";
     fi
   done
}

stopAll() {
  pidList=$(ps -A -o pid)
  for absPID in $pidDir/*
  do
     pid="$(basename -- $absPID)"
     if [[ $pidList == *"$pid"* ]]; then
        echoLog  "stopping process $pid $(cat $absPID)";
        kill -9 "$pid"
     fi
  done
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

status() {
   pids=$*;
   pidList=$(ps -A -o pid);
   var pid;

   if [ -z "$pids" ]
   then
      pids=$pidDir/*;
   fi
      for pidFile in "$pids"
      do
         pid="$(basename -- $pidFile)"
         if [[ $pidList == *"$pid"* ]]; then
            echoLog "Running Process Found: $pid $(cat $pidFile)";
         else
            echoLog "*NOT* Running Process: $pid $(cat $pidFile)";
         fi
      done
}

processPIDs() {
  serviceType=$1
  #Remove Request Service Type
  serviceParms=${serviceParms//$1/}
  pidList=$(ps -A -o pid)
  for absPID in $serviceParms
  do
     pid="$(basename -- $absPID)"
   case "${processType^^}" in
      CLEAN)
            clean $serviceParms;
            ;;
      DELETE)
            delete $serviceParms;
            ;;
      START)
            start $serviceParms
            ;;
      STOP)
            stop $serviceParms;
            ;;
      STATUS)
            status $serviceParms;
            ;;
      *) usage
        exit 1
        ;;
esac

if [[ $pidList == *"$pid"* ]]; then
        echoLog  "starting process $pid $(cat $absPID)";
        kill -9 "$pid"
     fi
  done
}

startJOB()
{
    procs=$1;
    $procs &;
    pid=$!;
    echo "start($1) EXECUTING: echo $procs &" | tee -a $logFile;
    echo $procs > $pidDir/$pid;
}

start() {
   setProcessType $1;
   procs="$*"
   
   case "${processType^^}" in
      NULL)
           usage "Start Requires Parameters";
           ;;
      ALL)
           echoLog "Starting Registered PIDs"
           processPIDs "START" $pidDir"/*;
           ;;
      PID)
           echoLog "Starting PIDs $procs"
           processPIDs "START" $procs;
           ;;
      JOB)
           echoLog "Starting Service(s) $procs"
           startJOB $procs;
           ;;
        *) usage;
           exit 1
           ;;
      esac
   }
}

### main logic ###
mode=$1
echoLog "<======== Executing service apps $args ========>"
# Concatinate Args
serviceParms=$(echo $args | cut -d " " -f2-)
#Remove Functions Call Name
serviceParms=${serviceParms//$1/}

case "${mode^^}" in
  CLEAN)
        clean $serviceParms;
        ;;
  DELETE)
        delete $serviceParms;
        ;;
  HELP|USAGE|ABOUT|?)
        help
        ;;
  RESTART|RELOAD)
        stop $serviceParms;
        start $serviceParms;
        ;;
  START)
        start $serviceParms
        ;;
  STOP)
        stop $serviceParms;
        ;;
  STATUS)
        status $serviceParms;
        ;;
  TEST)
        test $testScripts;
        ;;
 *) usage
        exit 1
        ;;
esac

exit 0
