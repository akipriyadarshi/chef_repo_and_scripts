#!/bin/bash
knife audit | tail -n +2 | awk '{ if($2 == 0) print $1;}'>knifeAudit.txt

file=knifeAudit.txt
for i in `cat $file`
do
knife cookbook delete "$i" -y
done
