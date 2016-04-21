#!/bin/bash
# This script replaces the current server settings with the latest
# available settings from our GitHub.
#
# Includes Missions, Modpack Keys and Difficulty Settings

# Download the content of the arma-server repo
cd /c/server
rm -rf Arma-Server
git clone https://github.com/1st-rapid-response-force/Arma-Server.git
cd Arma-Server

# Delete the default sections that we will overwrite
rm -rf /c/server/arma/keys
rm -rf /c/server/arma/mpmissions
rm -rf /c/server/arma/profiles
rm -rf /c/server/bec/Config

# Copy across replacement content
cp -r /c/server/Arma-Server/keys /c/server/arma/keys
cp -r /c/server/Arma-Server/mpmissions /c/server/arma/mpmissions
cp -r /c/server/Arma-Server/profiles /c/server/arma/profiles
cp -r /c/server/Arma-Server/Config /c/server/bec

# Generate a new BattlEye password
rm -rf /c/server/arma/battleye/beserver.cfg

cd /c/server/arma/battleye
NEW_PASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

echo "rconpassword "$NEW_PASSWORD > beserver.cfg
echo "RConPort 2315" >> beserver.cfg
echo "RConIP 192.168.0.1" >> beserver.cfg

mkdir /c/server/arma/profiles/BattlEye
cp /c/server/arma/battleye/beserver.cfg /c/server/arma/profiles/BattlEye/beserver.cfg
