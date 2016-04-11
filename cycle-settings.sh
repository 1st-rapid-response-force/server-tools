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
rm -rf /c/server/arma/battleye/beconfig.cfg

cd /c/server/arma/battleye
echo "rconpassword " > beconfig.cfg
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32} > beconfig.cfg

cp /c/server/arma/battleye/beconfig.cfg /c/server/arma/profiles/BattlEye/beconfig.cfg
