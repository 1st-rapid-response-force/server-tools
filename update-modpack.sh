#!/bin/bash
# This script updates the modpack to the latest version
cd /c/server/arma

rsync -avzhe ssh root@content.1st-rrf.com:/usr/share/nginx/html/modpack /c/server/arma
