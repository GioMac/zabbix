#!/bin/

#connection status check for Cisco/Linksys PAP2T

if [ "$1" == "uptime" ]; then
    curl --digest -u "$3:$4" "http://$2/" --connect-timeout 1 --retry 0 --stderr - |grep Elapsed|sed 's/.*darkblue\">\(.*\)<\/font.*/\1/'|awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }'
elif [ "$1"  == "registration" ]; then
    curl --digest -u "$3:$4" "http://$2/" --connect-timeout 1 --retry 0 --stderr - |grep -P "Registration State:.*Online"|wc -l    
fi
