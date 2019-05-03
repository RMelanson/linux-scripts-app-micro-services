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
testScripts=$servicesDir/test/scripts/*

#Trim args leading and trailing white spaces

echo "Executing service $args"

mode=$1

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
   echo "======================= ABOUT APPS SERVICES =========================="
   echo "# description: $prog ~ Add Applications as a Services"
   echo "# processname: $prog"
   echo "# Author     : Robin Melanson (Contractor)"
   echo "# Contact    : robin.e.melanson@gmail.com"
   usage
}

help () {
   about
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

start() {
   process="$*"
   echo "START($process)"
   if [ -z "$process" ]
   then
      usage "***ERROR*** PROGRAM NOT DEFINED"
   else
       $process &
       pid=$!
       echo "start($1) EXECUTING: echo $process &"
       echo $process > $pidDir/$pid
   fi
}

stopProcess() {
   pid=$1
   if [ -z "$pid" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
     pidFile=$pidDir/$1
     echo STOPPING PID $pid for process $pidFile
     rm $pidFile
     kill -9 $pid
    fi
}

stop() {
   process="$*"
   echo "STOP($process)"
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

test() {
   testDir="$*"
   echo "TEST($testDir)"
   for f in $testDir
   do
      echo "Starting Test File $f"
      script=$(cat $f)
      start "$script"
   done
}

showStatus() {
   pid=$1
   echo "SHOW STATUS($pid)"
   if [ -z "$pid" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
     pidFile=$pidDir/$1
     cat $pidFile
#     rm $pidFile
#     kill -9 $pid
   fi
}

clean() {
   echo "======================= APPS CLEAN SERVICES =========================="
}

status() {
   pids=$*
   #Remove Functions Call Name
   pids=${pids//$1/}

   echo "===================== SHOW APP SERVICES STATUS ======================="
   echo "STATUS($pids)"
   if [ -z "$pids" ]
   then
      for file in $pidDir/*
      do
         pid="$(basename -- $file)"
         #echo "FOUND PID $pid"
         showStatus "$pid"
      done
   else
      for file in "$pids"
      do
         pid="$(basename -- $file)"
         #echo "FOUND PID $pid"
         showStatus "$pid"
      done
   fi
   echo "======================================================================"
}

### main logic ###
# Concatinate Args
serviceParms=$(echo $args | cut -d " " -f2-)

case "$mode" in
  start)
        start $serviceParms
        ;;
  stop)
        stop $serviceParms
        ;;
  test)
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
