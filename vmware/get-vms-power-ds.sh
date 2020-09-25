#!/bin/sh
VMS=`vim-cmd vmsvc/getallvms | grep -v Copyright | grep -v For | awk '!/Vmid/{print $1}'`
HOSTNAME=`hostname -s`
echo "Hostname,VMID,VMName,Powerstate,Datastore"
for VMID in $VMS ; do
 PWR=`vim-cmd vmsvc/power.getstate $VMID | grep -v Retrieved | awk '{print $2}'`
 VMNAME=`vim-cmd vmsvc/get.config $VMID | grep -i "name =" | awk '{print $3}' | head -1 | awk -F'"' '{print $2}'`
 DS=`vim-cmd vmsvc/get.datastores $VMID | head -1 | awk '{print $2" "$3" "$4}'`
 echo "$HOSTNAME,$VMID,$VMNAME,$PWR,$DS" 
done
