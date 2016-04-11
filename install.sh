#!/bin/bash
# This script is part of the 1st RRF server-tools and is licensed
# under the MIT license
CONTENT_SERVER_PASSWORD=""
STEAM_ACCOUNT_PASSWORD="3xW65MAiVx9n"

# Create a server directory to hold all of the ARMA related files
cd /c
mkdir server
cd server

# Create the sub directories that are relevant
mkdir arma
mkdir steam
mkdir bec

# Download and unpack the steamcmd
cd steam
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
unzip steamcmd.zip
rm -rf steamcmd.zip

# Run the steamcmd to download the ARMA 3 binaries
./steamcmd.exe +login 23rdgamediv $STEAM_ACCOUNT_PASSWORD +force_install_dir ../arma +app_update 233780 +quit

# Download the modpack via rsync
/bin/bash /c/server-tools/update-modpack.sh

# Download the BattleEye Enhanced Tools
cd /c/server/bec
wget ibattle.org/Downloads/Bec.zip
unzip Bec.zip
rm -rf Bec.zip

# Download the latest settings
/bin/bash /c/server-tools/cycle-settings.sh

# Copy the server.cfg across
cp /c/server/Arma-Server/server.cfg.example /c/server/arma/server.cfg

# Download the Fusion DLL
cd /c/server/arma
wget https://bitbucket.org/micovery/sock.dll/raw/v0.0.2/Release/sock.dll

# Create a random RCON password
cd /c/server/arma/battleye
echo "rconpassword " > beconfig.cfg
< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32} > beconfig.cfg

echo "" > Bans.txt
