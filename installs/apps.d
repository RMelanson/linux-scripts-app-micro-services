#!/bin/bash
# chkconfig: 2345 20 80
# description: appServices ~ Start an Application as a Services
# process Name: start
# pidDir: /etc/init.d/servives
# Author: Robin Melanson (Contractor)
# Contact: robin.e.melanson@gmail.com

noArgs=$#

servicesDir=/etc/init.d/services
pidDir=$servicesDir/ids
testScripts=$servicesDir/test/scripts/*

args="$*"

#Trim args leading and trailing white spaces

echo "Executing service $args"

# Concatinate Args
exe=$(echo $args | cut -d " " -f2-)

mode=$1

usage ()
{
   echo $"Usage: $0 {start|stop|restart|status|help}"
}

help ()
{
   clear;
   echo "=======================  $prog HELP MENU ============================"
   echo "# description: $prog ~ Add Applications as a Services"
   echo "# processname: $prog"
   echo "# Author     : Robin Melanson (Contractor)"
   echo "# Contact    : robin.e.melanson@gmail.com"
   echo "======================================================================"
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
}

start(){
   echo "apps.d: START($1) entered"
   prog=$(echo $args | cut -d " " -f2-)
   if [ ! -z "$*" ]
   then
      echo STARTING $prog
      $prog &
      pid=$!
      echo "start($1) EXECUTING: echo $prog &"
      echo $prog > $pidDir/$pid
   else
      echo "***ERROR*** PROGRAM NOT DEFINED"
   fi
}

stop(){
   echo "apps.d: STOP($1) entered"
   if [ "$pid" -ne 0 ]
   then
      echo STOPPING PID $pid for process $jarFile
      rm $pidFile
      kill -9 $pid
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

status(){
    echo "apps.d: STATUS($1) entered"
}

### main logic ###
case "$mode" in
  start)
        start $exe
        ;;
  stop)
        stop
        ;;
  test)
        test $testScripts
        ;;
  status)
        status
        ;;
  restart|reload|condrestart)
        stop
        start
        ;;
  help|usage|about|?)
        help
        ;;
 *) usage
        exit 1
        ;;
esac

exit 0
