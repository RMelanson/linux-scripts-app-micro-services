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

# Concatinate Args
serviceParms=$(echo $args | cut -d " " -f2-)

mode=$1

usage()
{
   if [ ! -z $1 ]
   then
     echo $1
   fi
   echo "=============================USAGE================================"
   echo $"Usage: $0 {start|stop|restart|status|help}"
}

about()
{
   clear;
   echo "======================= ABOUT APPS SERVICES =========================="
   echo "# description: $prog ~ Add Applications as a Services"
   echo "# processname: $prog"
   echo "# Author     : Robin Melanson (Contractor)"
   echo "# Contact    : robin.e.melanson@gmail.com"
   usage
}

help ()
{
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

startServive(){
       echo STARTING $prog
       $prog &
       pid=$!
       echo "start($1) EXECUTING: echo $prog &"
       echo $prog > $pidDir/$pid
}

start(){
   parms="$*"
   echo "apps.d: START($parms) entered"
   prog=$(echo $parms | cut -d " " -f2-)
   if [ -z "$parms"args ]
   then
      usage "***ERROR*** PROGRAM NOT DEFINED"
   else
      for process in "$@"
      do
         startServive "$process"
      done
   fi
}

}

stopProcess(){
   pid=$1
   if [ -z "$pid" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
     pidFile=pidDir/$1
     echo STOPPING PID $pid for process $pidFile
     rm $pidFile
     kill -9 $pid
    fi
}

stop(){
   echo "apps.d: START($args) entered"
   pids=$(echo $args | cut -d " " -f2-)
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

test(){
   echo "apps.d: TEST($1) entered"
   for f in $1
   do
      echo "Starting Test File $f"
      script=$(cat $f)
      start "$script"
   done
}

showStatus(){
   pid=$1
   if [ -z "$pid" ]
   then
      usage "***ERROR*** NO PID TO STOP"
   else
     pidFile=pidDir/$1
     echo STATUS $pid for process $pidFile
     cat $pidFile
     rm $pidFile
     kill -9 $pid
   fi
}

status(){
   echo "====================== APPS SERVICES STATUSES ========================"
   echo "apps.d: START($args) entered"
   prog=$(echo $args | cut -d " " -f2-)
   if [ -z "$*" ]
   then
      echo RUNNING PROCESSES
      for f in $pidDir
      do
         showStatus "$pid"
      done
   else
      for pid in "$pids"
      do
         showStatus "$pid"
      done
   fi
   echo "======================================================================"
}

### main logic ###
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
