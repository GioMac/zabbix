#!/bin/bash

usage(){
    echo "Usage: $0 [MSISDN] [message] <body>"
    exit 1
}

[[ $# -eq 0 ]] && usage

to="$1"
subj="$2"
body="$3"

to="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$to")"
subj="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$subj")"
body="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$body")"

if [ "$(curl -s "http://ws.test.ge/sms.php?to=$1&subj=$subj")" == "OK" ]; then
    exit 0
else
    exit 1
fi
