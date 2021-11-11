#!/bin/bash

while getopts ":ht" opt; do
  case ${opt} in
    u ) 
      u="$OPTARG"
      ;;
    s ) # process option t
      s="$OPTARG"
      ;;
    d ) # process option t
      d="$OPTARG"
      ;;
    n ) # process option t
      n="$OPTARG"
      ;;
    p ) # process option t
      p="$OPTARG"
      ;;
    
    \? ) echo "Usage: mysql-transfer [-u username] [-p password] [-n db name] [-s source host] [-d destination host]"
      ;;
  esac
done

mysqldump -h $s --verbose -u $u --password=$p $n | mysql -u $u --password=$p -h $d --password=$p $n
