#!/bin/bash

usage(){
    echo "Usage: $0 [MSISDN] [message] <body>"
    exit 1
}

[[ $# -eq 0 ]] && usage

to="$1"
subj="$2"
body="$3"

sudo gammu-smsd-inject TEXT +$to -text "$subj"

