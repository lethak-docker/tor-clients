#!/bin/bash

echo [`date`] Bootstraping...

function clean_up {
    # Perform program exit housekeeping
    echo [`date`] Exiting ...
    exit
}

echo [`date`] Starting...

trap clean_up SIGTERM

#echo [`date`] Bootstraping finished.
#/usr/bin/tor

sleep 5 & pid=$!
wait $pid
curl --socks5 127.0.0.1:11050 http://checkip.amazonaws.com > /tmp/ip.txt && "\n\nVisible IP:\n" && cat /tmp/ip.txt

#tail -f /dev/null &
#child=$!
#wait "$child"