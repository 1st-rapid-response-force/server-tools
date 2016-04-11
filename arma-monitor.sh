#!/bin/bash
# This script is part of the 1st RRF server-tools and is licensed
# under the MIT license

# Server Monitor is designed to continously monitor for the server
# process to be down

while true; do

if pgrep arma3server >/dev/null 2>&1
  then
    echo "ARMA Server Status Check - PASSED"
  else
    echo "ARMA Server Status Check - FAILED"
/bin/bash /c/server-tools/start-arma.sh

fi

# Wait 30 seconds before we bring the server back up
sleep 30s
done
