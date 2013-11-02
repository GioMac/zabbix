#!/bin/bash

BYTES="$(stat /backup/mikrotik/`date +\%F`/today.backup 2>/dev/null|grep Size|awk '{ print $2 }')"

if [[ "$BYTES" =~ ^-?[0-9]+$ ]]; then
    echo $BYTES
else
    echo "0"
fi
