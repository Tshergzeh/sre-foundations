#!/bin/bash
# Get uptime in human-readable format
UPTIME_PRETTY=$(uptime -p)
echo "System status: $UPTIME_PRETTY"

# Get memory usage in MB
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Get disk usage in human-readable format
df -h
