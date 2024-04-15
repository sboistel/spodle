#!/usr/bin/env bash
#############################################################
# 
# Author:       Samuel BOISTEL
# Topic:        Download Music via SpotDL
# Date:         March 2024
# Description:  This script is used to download music from youtube through Spotify
#               https://github.com/spotDL/spotify-downloader
#############################################################

# VARS
url=$1
dl_dir="${HOME}/Music"

if [ -z "$url" ]; then
    echo "Please provide a URL"
    exit 1
fi

# Source PyVenv
if [ -f ${PYVENV}/spotdl/bin/activate ]
then
    . ${PYVENV}/spotdl/bin/activate
else
    echo "Error while activating PyVenv"
    echo "python3 -m venv spotdl"
    echo "source spotdl/bin/activate"
    exit 1
fi

# Download Directory
if [ "$dl_dir" = "" ]; then
    dl_dir=/tmp/spotdl
    mkdir -p $dl_dir
fi

# Run Download
if [ dl_dir != "" ] || [ url != "" ]; then
    echo "Downloading music from $url to $dl_dir"
    cd $dl_dir
    #spotdl $url --restrict strict --output $dl_dir'/{artist}/{album}/{title}'
    spotdl $url --restrict strict --output $dl_dir'/{album}/{artist} - {title}'
fi

# EOF
