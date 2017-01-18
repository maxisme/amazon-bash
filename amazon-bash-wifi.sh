#!/bin/bash
if [ -z "$(ifconfig | grep 'mon0')" ]
then
        airmon-ng start wlan0
fi

START=$(date +%s);
tcpdump -l -i mon0 ether host "<MAC ADDRESS>" | while read b; do
        END=$(date +%s);
        diff=`echo $((END-START)) | awk 'int($1%60)'` #get time since last press
        if [ $(($diff)) -gt 3 ] # tcdump sends multiple outputs. And you also can't press the button again within 3 seconds so this isn't a floor.
        then
                START=$(date +%s)
                echo "Ding Dong"
        fi
done
