#!/bin/bash
# script downloads file from Google Drive
# usage: gget.sh <FILE_ID> <FILENAME_TO_SAVE>

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=$1" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -s -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=$1" -o $2
