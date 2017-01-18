#!/bin/bash
START=$(date +%s);
tcpdump -l -i eth0 ether host "<MAC ADDRESS>" | while read b; do
        END=$(date +%s);
        diff=`echo $((END-START)) | awk 'int($1%60)'` #get time since last press
        if [ $(($diff)) -gt 3 ] # tcdump sends multiple outputs. And you also can't press the button again within 3 seconds so this isn't a floor.
        then
                START=$(date +%s)
                echo "Ding Dong"
        fi
done
