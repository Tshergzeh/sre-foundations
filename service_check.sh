#!/bin/bash

status_code=$(curl -s -o /dev/null -I -w "%{http_code}" $1)

if [ "$status_code" -eq 200 ]; then
    echo "Success: Received 200 OK"
else
    echo "Failed: Received $status_code"
fi
