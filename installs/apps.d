#!/bin/bash
# chkconfig: 2345 20 80
# description: appServices ~ Start an Application as a Services
# process Name: start
# pidDir: /etc/init.d/appProcesses
# Author: Robin Melanson (Contractor)
# Contact: robin.e.melanson@gmail.com

noArgs=$#

testScripts=/etc/init.d/appProcesses/test/scripts/*
servicesDir=/etc/init.d/services
pidDir=$services/ids
# Concatinate Args
args="$*"

#Trim args leading and trailing white spaces
args=$(echo -e $args | sed 's/^[ \t]*//;s/[ \t]*$//')

echo "Executing service start $args"

exe=$(echo -e $args | sed -e 's/^\w*\ *//')

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

setPID_File(){
   proc=$(ps -ef | grep $jarFile)
   pid=$(echo $proc|cut -d' ' -f2)
   echo proc = $proc
   pid=$(echo $proc| cut -d' ' -f2)
   echo $pid > $pidFile
   return $pid
}

pid=0

getPID() {
   if [ -z $pidFile ]
   then
      echo \*\*\* ERROR \*\*\* PROCESS ID $pidFile NOT DEFINED
      exit -1
   elif [ -f $pidFile ]
      then
          pid=$(cat $pidFile)
          echo "Found pid $pid for Process %jarFile"
      else
          echo "***ERROR *** PID FILE  $pidFile. NOT FOUND" 1>&2
          pid=0
   fi
}

start(){
echo "apps.d: START($1) entered"
   prog=$1
   echo STARTING $prog
   $prog &
   pid=$!
   echo  "start($1) EXECUTING: echo $prog & | tee $pidDir/$pid"
   echo "$prog" | tee $pidDir/$pid
   echo "start($1) EXECUTING: ps -ef | grep $pid"
   proc=$(ps -ef | grep $pid)
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

#  then
#      echo "process $pidFile already running. " 1>&2
#      echo To restart try ""service saAPIs  $jarFile restart""
#  else
#     delaySecs=100
#     run="java -jar $jarFile $delaySecs"
#     $run &
#     setPID_File
#  fi

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
  help)
        help
        ;;
 *) usage
        exit 1
        ;;
esac

exit 0
  
