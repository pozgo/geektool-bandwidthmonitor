#!/bin/bash
rrdtool="/usr/local/bin/rrdtool"
while :
do
    data=$(netstat -i -b | grep en0 | tail -n 1 | awk '{print $7" "$10}')
    inbytes=$( echo $data | awk '{print $1}')
    oubytes=$( echo $data | awk '{print $2}')
    $rrdtool update bwusage_en0_db.rrd N:$inbytes:$oubytes
    sleep 9
done