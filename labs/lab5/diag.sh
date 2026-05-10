#!/bin/bash

LOG_DIR="/var/log/server_diag"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/diag_$(date +%Y%m%d_%H%M%S).log"

touch "$LOG_FILE"
exec > "$LOG_FILE) 2>&1"
set -euo pipefail

echo "===DIAG $(date)==="

echo -e "\n [uptime]"
uptime

echo -e "\n [RAM]"
free -h | grep -E 'Mem:'

echo -e "\n [DISK]"
df -h

echo -e "\n [LISTENNING PORTS]"
ss -tulpn -H 2>/dev/null

