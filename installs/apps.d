#!/bin/bash
# chkconfig: 2345 20 80
# description: appServices ~ Start an Application as a Services
# processname: appServices
# pidDir: /etc/init.d/appProcesses
# Author: Robin Melanson (Contractor)
# Contact: robin.e.melanson@gmail.com

noArgs=$#

testScripts=/etc/init.d/appProcesses/test/scripts/*
pidDir=/etc/init.d/appProcesses/ids
# Concatinate Args
args="$*"

#Trim args leading and trailing white spaces
args=$(echo -e $args | sed 's/^[ \t]*//;s/[ \t]*$//')

echo "Executing service appServices.d $args"

exe=$(echo -e $args | sed -e 's/^\w*\ *//')

mode=$1

usage ()
{
   echo $"Usage: $0 {start|stop|restart|status|help}"
}

usage () {
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

about ()
{
   clear;
   echo "=======================  $prog HELP MENU ============================"
   echo "# description: $prog ~ Add Applications as a Services"
   echo "# processname: $prog"
   echo "# Author     : Robin Melanson (Contractor)"
   echo "# Contact    : robin.e.melanson@gmail.com"
   echo "======================================================================"
   usage
}

start(){
   prog=$1
   echo STARTING $prog
   $prog &
   pid=$!
   echo  "start($1) EXECUTING: echo $prog & | tee $pidDir/$pid"
   echo "start($1) EXECUTING: ps -ef | grep $pid"
   proc=$(ps -ef | grep $pid)
}

test(){
   for f in $1
   do
      echo "Starting Test File $f"
      script=$(cat $f)
      start $script
   done
   
}

stop(){
   if [ -z $1 ]
   then
       echo "***ERROR*** PID not specified"
       usage
   else
      pid=$1
      pidfile=pidDir$pid
      echo STOPPING PID $pid for process $pidfile
      if [ -f $pidFile ]
      then
          rm $pidFile
          kill -9 $pid
      else
          echo "*** ERROR PID $pid not Managed by apps services"
      fi
   fi
}

status() {
   getPID
   if [ $pid -eq 0 ]
   then
      echo NOT RUNNING PROGRAM $jarFile
   else
      echo process $pid RUNNING as PROGRAM $jarFile
   fi
}

### main logic ###
case "$mode" in
  start)
        start $exe
        ;;
  stop)
        pid=$2
        stop $2
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
  help|about)
        help
        ;;
 *) usage
        exit 1
        ;;
esac

exit 0
  
