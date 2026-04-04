#!/bin/bash
echo $(tail -n 100 /var/log/syslog | grep -o "error" | wc -l)
