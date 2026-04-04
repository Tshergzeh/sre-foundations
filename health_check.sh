#!/bin/bash

# Check disk health (unhealthy if usage > 80%)
DISK_THRESHOLD=80
DISK_USAGE=$(df -Ph / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -lt "$DISK_THRESHOLD" ]; then
    DISK_HEALTHY=true
else
    DISK_HEALTHY=false
fi

# Check memory health (unhealthy if free memory < 500MB)
MEMORY_THRESHOLD=500
AVAILABLE_RAM=$(free -m | awk '/^Mem:/ {print $7}')

if [ "$AVAILABLE_RAM" -ge "$MEMORY_THRESHOLD" ]; then
    MEMORY_HEALTHY=true
else
    MEMORY_HEALTHY=false
fi

# Check service health
SERVICE=$1

if systemctl is-active --quiet "$SERVICE"; then
    SERVICE_HEALTHY=true
else
    SERVICE_HEALTHY=false
fi

# Overall health output
if [[ "$DISK_HEALTHY" && "$MEMORY_HEALTHY" && "$SERVICE_HEALTHY" ]]; then
    echo "Health summary: Healthy"
else
    echo "Health summary: Unhealthy"
fi

echo "Disk health: $DISK_HEALTHY"
echo "Memory health: $MEMORY_HEALTHY"
echo "Service health: $SERVICE_HEALTHY"
