#!/bin/bash

SERVICE=$1

if systemctl is-active --quiet "$SERVICE"; then
    echo "$SERVICE is running."
else
    systemctl start "$SERVICE"
    echo "$SERVICE has been restarted."
fi
