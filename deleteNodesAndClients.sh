#!/bin/bash
knife status | awk -F',' 'BEGIN {cmd="date +\"%s\""; cmd | getline sdate; close(cmd)} {cmd="date -d \""$1"\" +\"%s\"";cmd | getline rdate; close(cmd); if ((sdate - rdate) >= 3600) print $2}'>nodeList.txt 
file=nodeList.txt
for i in `cat $file`
do
knife node delete "$i" -y
knife client delete "$i" -y
done
