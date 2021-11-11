#!/bin/bash

while getopts "u:s:d:n:p:a:" opt; do
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
    a ) 
        a="$OPTARG"
        ;;
    
    \? ) echo "Usage: mysql-transfer [-u username] [-a password] [-n db name] [-p port] [-s source host] [-d destination host]"
      ;;
  esac
done
echo "user: $u, password: $a, dbname: $n"
echo "source: $s"
echo "dest: $d"

mysqldump -h "$s" --verbose -u "$u" --password="$a" --port "$p" "$n" | mysql -u "$u" --password="$a" -h "$d" --port "$p" --password="$p" "$n"
