#!/bin/bash
# This script is part of the 1st RRF server-tools and is licensed
# under the MIT license

# Server Monitor is designed to continously monitor for the server
# process to be down

while true; do

if pgrep arma3server >/dev/null 2>&1
  then
  else
     echo "arma3server not running sending restart"
/bin/bash /c/server-tools/start-arma.sh

fi

sleep 1m
done
