#!/bin/bash
MAC="<AMAZON DASH MAC ADDRESS>"

START=$(date +%s);
tcpdump -l -i eth0 ether host "$MAC" | while read b; do
        END=$(date +%s);
        diff=`echo $((END-START)) | awk 'int($1%60)'` # Get time since last click.
        if [ $(($diff)) -gt 2 ] # 2 seconds since last click as tcdump has multiple outputs.
        then
                START=$(date +%s)
                
                # Performed on click
                echo "Ding Dong"
        fi
done
