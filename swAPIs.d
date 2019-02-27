#!/bin/bash
# chkconfig: 2345 20 80
# description: swAPIs ~ Stock Widget Microservices
# processname: swAPIs
# pidFile: /opt/MICRO-SERVICES/swAPIs.pid
# Author     : Robin Melanson (Contractor)
# Contact    : robin.e.melanson@gmail.com

parms="$1 $2 $3 $4"
noArgs=$#
#Trim parms leading and trailing white spaces
parms=$(echo -e $parms | sed 's/^[ \t]*//;s/[ \t]*$//')
echo "Executing service s3fs $parms"

mode=$1

if [ $noArgs -gt 1 ]
then
   prefix='.jar'
   progName=$2
else
   progName=helloWorld-0.0.1-SNAPSHOT
fi

exedir=/opt/MICRO-SERVICES/swAPIs
jarFile=$exedir/$progName.jar

if [ ! -f $jarFile ]
then
   echo "***NO EXECUTABLE FILE***  $jarFile. " 1>&2
   exit -1
fi

pidFile=$exedir/$progName.pid

usage ()
{
   echo $"Usage: $0 {start|stop|restart|status|help}"
     }

help ()
{
   clear;
   echo "=======================  swAPIs HELP MENU ============================"
   echo "# description: swAPIs ~ Java swAPIs microservices"
   echo "# processname: s3fs"
   echo "# Author     : Robin Melanson (Contractor)"
   echo "# Contact    : robin.e.melanson@gmail.com"
   echo "======================================================================"
   echo "Usage(1): service s3fs start <cmd (Optional)>"
   echo "             The swAPI services will be started"
   echo "Usage(2): service s3fs stop"
   echo "             The swAPI services will be stopped"
   echo "Usage(3): service s3fs restart"
   echo "             The swAPI services will be restarted"
   echo "             This is accomplished through starting"
   echo "             and stopping the wAPIs app"
   echo "Usage(4): service s3fs *"
   echo "             Prints out the swAPIs usage syntax"
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
   if [ -f $pidFile ]
   then
       pid=$(cat $pidFile)
       echo "Found pid $pid for Process %jarFile"
   else
       echo "***NO PID FILE***  $pidFile. " 1>&2
       pid=0
   fi
}


start(){
   echo STARTING
   if [ -f $pidFile ]
   then
       echo "process $pidFile already running. " 1>&2
       echo To restart try ""service saAPIs  $jarFile restart""
   else
      delaySecs=100
      run="java -jar $jarFile $delaySecs"
      $run &
      setPID_File
   fi
}

stop(){
   getPID
   if [ "$pid" -ne 0 ]
   then
      echo STOPPING PID $pid for process $jarFile
      rm $pidFile
      kill -9 $pid
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
        start
        ;;
  stop)
        stop
        ;;
  restart)
        $0 stop
        $0 start
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
  
