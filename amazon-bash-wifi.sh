#!/bin/bash
MAC="<AMAZON DASH MAC ADDRESS>"

if [ -z "$(ifconfig | grep 'mon0')" ]
then
        airmon-ng start wlan0
fi

START=$(date +%s);
tcpdump -l -i mon0 ether host "$MAC" | while read b; do
        END=$(date +%s);
        diff=`echo $((END-START)) | awk 'int($1%60)'` # Get time since last click.
        if [ $(($diff)) -gt 3 ] # wait 3 seconds after last click - tcdump has multiple outputs.
        then
                START=$(date +%s)

                # Performed on click
                echo "Ding Dong"
        fi
done
