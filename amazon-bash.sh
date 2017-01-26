#!/bin/bash
MAC="<AMAZON DASH MAC ADDRESS>"

function onClick {
    #code to be ran on click
    echo "Ding Dong"
}

START=$(date +%s);
tcpdump -l -i eth0 ether host "$MAC" | while read b; do
    END=$(date +%s);
    diff=`echo $((END-START)) | awk 'int($1%60)'` # Get time since last click.
    if [ $(($diff)) -gt 3 ] # wait more than 3 seconds after last click - tcdump has multiple outputs.
    then
        START=$(date +%s)
        onClick & # run in background
    fi
done
