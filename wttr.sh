#!/bin/bash
############################
# wttr.sh
# This script pulls weather data for use in the local tmux,
# getting called by a cron job so as to not call it every 
# time the status bar updates
############################

dir="$( cd "$( dirname "${BASH_SOURCE[0]}"   )" >/dev/null 2>&1 && pwd   )"

if ps -ef | grep -v grep | grep tmux ; then
    curl -s wttr.in?format=%c🌡️%t%20%w%20%m\&?m > $dir/../.wttr.txt
    exit 0
else
    exit 0
fi
