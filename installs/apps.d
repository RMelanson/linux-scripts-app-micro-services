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

#Trim args leading and trailing white spaces

setLogFile(){
   logfile=log$(date +"%y-%m-%d")
}

echoLog() {
   setLogFile
   parms="$*"
   tm=$(date +"%H:%M:%S>")
   tmParms = $tm$parms
   echo $tmParms ! tee -a $logfile
   log $tmParms 
}

log() {
   echo $1 >> $logfile
}

usage() {
   if [ ! -z $1 ]
   then
     echo $1
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
   echoLog "====================  APPS SERVICES HELP MENU ========================"
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

stopProcess() {
   pid=$1
   if [ -z "$pid" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
     pidFile=$pidDir/$1
     echoLog STOPPING PID $pid for process $pidFile
     rm $pidFile
     kill -9 $pid
    fi
}

stop() {
   process="$*"
   echoLog "STOP($process)" | tee -a $logFile
#   pids=$(echo $args | cut -d " " -f2-)
   if [ -z "$pids" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
      for pid in "$pids"
      do
         stopProcess "$pid"
      done
    fi
}

start() {
   process="$*"
   echoLog "START($process)" | tee -a $logFile
   if [ -z "$process" ]
   then
      usage "***ERROR*** PROGRAM NOT DEFINED"
   else
       $process &
       pid=$!
       echo "start($1) EXECUTING: echo $process &" | tee -a $logFile
       echo $process > $pidDir/$pid
   fi
}

test() {
   testDir="$*"
   echoLog "TEST($testDir)" | tee -a $logFile
   for f in $testDir
   do
      echoLog  "Starting Test File $f"
      script=$(cat $f)
      start "$script"
   done
}

showStatus() {
   absPID=$1
   pid=$(basename -- $absPID)
   if [ -z "$pid" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
     pidFile=$pidDir/$1
     echo "$pid $(cat $pidFile)"
   fi
}

clean() {
   echoLog "======================= APPS CLEAN SERVICES =========================="   
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

status() {
   pids=$*
   #Remove Functions Call Name
   pids=${pids//$1/}

   echoLog "===================== SHOW APP SERVICES STATUS ======================="
   echoLog "STATUS($pids)"
   if [ -z "$pids" ]
   then
      for file in $pidDir/*
      do
         pid="$(basename -- $file)"
         showStatus "$pid"
      done
   else
      for file in "$pids"
      do
         pid="$(basename -- $file)"
         showStatus "$pid"
      done
   fi
}

### main logic ###
mode=$1
echoLog "Executing service $args"
# Concatinate Args
serviceParms=$(echo $args | cut -d " " -f2-)

case "$mode" in
  start)
        clean;
        start $serviceParms
        ;;
  stop)
        clean;
        stop $serviceParms
        ;;
  test)
        clean;
        test $testScripts
        ;;
  status)
        status $serviceParms
        ;;
  clean)
        clean $serviceParms
        ;;
  restart|reload)
        stop $serviceParms
        start $serviceParms
        ;;
  help|usage|about|?)
        help
        ;;
 *) usage
        exit 1
        ;;
esac

exit 0
