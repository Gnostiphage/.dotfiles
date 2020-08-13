#!/bin/bash
############################
# wttr.sh
# This script pulls weather data for use in the local tmux,
# getting called by a cron job so as to not call it every 
# time the status bar updates
############################

dir="$( cd "$( dirname "${BASH_SOURCE[0]}"   )" >/dev/null 2>&1 && pwd   )"

if ps -ef | grep -v grep | grep -q tmux ; then
    curl -s wttr.in?format=%c%20%t%20%w%20%m\&?m |
        sed 's/.*Unknown location.*//' |
        sed 's/✨//;s/☁️//;s/🌫 //;s/🌧 //;s/❄️//;s/🌦 //;s/🌧 //;s/🌨 //;s/⛅️//;s/☀️//;s/🌩//;s/⛈//' |
#        sed 's/↓//;s/↙//;s/←//;s/↖//;s/↑//;s/↗//;s/→//;s/↘//' |
#        sed 's/🌑//;s/🌒//;s/🌓//;s/🌔//g;s/🌕//;s/🌖//;s/🌗//;s/🌘//' > $dir/../.wttr.txt
        sed 's/🌑/🌕/;s/🌒/🌖/;s/🌓/🌗/;s/🌔/🌘/;s/🌕/🌑/;s/🌖/🌒/;s/🌗/🌓/;s/🌘/🌔/' > $dir/../.wttr.txt
    exit 0
else
    exit 0
fi
