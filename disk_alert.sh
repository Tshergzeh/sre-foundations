#!/bin/bash

THRESHOLD=80

USAGE=$(df -Ph / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "CRITICAL: Disk usage is at ${USAGE}% on $(hostname)!"
fi
