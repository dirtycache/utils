#!/bin/sh
HOSTS=`cat hosts.txt`
for HOST in $HOSTS ; do
 ssh root@$HOST /get-vms-power-ds.sh
done
