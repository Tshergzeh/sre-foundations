#!/bin/bash
# Check if process is running
if pgrep -x "$1" > /dev/null; then
    echo "Running"
else
    echo "Not running"
fi

