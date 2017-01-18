#!/bin/bash
MAC="<MAC ADDRESS>"

if [ -z "$(ifconfig | grep 'mon0')" ]
then
        airmon-ng start wlan0
fi

START=$(date +%s);
tcpdump -l -i mon0 ether host "$MAC" | while read b; do
        END=$(date +%s);
        diff=`echo $((END-START)) | awk 'int($1%60)'` # Get time since last click.
        if [ $(($diff)) -gt 2 ] # 2 seconds since last click. As tcdump sends multiple outputs.
        then
                START=$(date +%s)
                
                # Performed on click
                echo "Ding Dong"
        fi
done
