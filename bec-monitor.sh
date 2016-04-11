#!/bin/bash
# This script is part of the 1st RRF server-tools and is licensed
# under the MIT license

# Server Monitor is designed to continously monitor for the BEC process
# to go down.

while true; do

if pgrep bec >/dev/null 2>&1
  then
    echo "BEC Server Status Check - PASSED"
  else
    echo "BEC Server Status Check - FAILED"
/c/server/bec/bec.exe

fi

# Wait 20 seconds before we bring the server back up
sleep 20s
done
