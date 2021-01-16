#!/bin/bash

base="/tmp/"

if [ -z "$1" ]
then
  echo "No option provided"
  exit 1
fi

case "$1" in 
start)
  if [ -z "$2" ]
  then
   echo "No command provided"
   exit 1
  fi
  if [ -z "$3" ]
  then
   echo "No name provided"
   exit 1
  fi
  $2  > /dev/null &
  pid="$!"
  echo "Run \"$2\" - pid=$pid"
  echo $pid > $base$3.pid
  ;;

stop)
  if [ -z "$2" ]
  then
   echo "No name provided"
   exit 1
  fi
  if test -f "$base$2.pid"; then
    pid=$(cat $base$2.pid)
    kill $pid
    rm $base$2.pid
    echo "Killed \"$2\" - pid=$pid"
  else
    echo "Can't find \"$2\" >> $base$2.pid"
  fi
  ;;

status)
  if [ -z "$2" ]
  then
   echo "No name provided"
   exit 1
  fi
  if test -f "$base$2.pid"; then
    pid=$(cat $base$2.pid)
    if [[ $(ps -p $pid) == *$pid* ]]; 
    then
      echo "\"$2\" is running - pid=$pid"
      exit 0
    fi
  fi
  echo "\"$2\" is not running"
  ;;

list)
  count=`ls -1 $base*.pid 2>/dev/null | wc -l`
  if [ $count == 0 ]
  then 
    echo "No childs running"
    exit 0
  fi 
  echo "Running:"
  for file in $`ls $base*.pid`
  do
    filename=$(basename $file ".pid")
    pid=$(cat $base$filename.pid)
    echo "* $filename - pid=$pid"
  done
  ;;

*)
  echo "|-------------------------------------------------------|"
  echo "|  Example                                              |"
  echo "|-------------------------------------------------------|"
  echo "| sh parally.sh start 'sh date_writer.sh' date_writer   |"
  echo "| sh parally.sh stop date_writer                        |"
  echo "| sh parally.sh status date_writer                      |"
  echo "| sh parally.sh list                                    |"
  echo "|-------------------------------------------------------|"
esac

exit 0 
