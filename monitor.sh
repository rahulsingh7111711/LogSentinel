#!/bin/bash

# Load configuration
source "$(dirname "$0")/config.env"

# Ensure logs directory exists
mkdir -p logs

# Define logs and output
SYSLOG="/var/log/syslog"
AUTHLOG="/var/log/auth.log"
#AUTHLOG="/tmp/fake_auth.log"

REPORT="/tmp/logsentinel_report.txt"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Start building report
echo "🔍 LogSentinel Report - $DATE" > "$REPORT"
echo "==============================" >> "$REPORT"

# SSH login failures
if [ -f "$AUTHLOG" ]; then
    echo -e "\n🚨 Failed SSH login attempts:" >> "$REPORT"
    grep "Failed password" "$AUTHLOG" | tail -n 5 >> "$REPORT"
else
    echo -e "\n[!] $AUTHLOG not found. Skipping SSH login check." >> "$REPORT"
fi

# Sudo authentication failures
if [ -f "$AUTHLOG" ]; then
    echo -e "\n🔐 Sudo authentication failures:" >> "$REPORT"
    grep "sudo" "$AUTHLOG" | grep "authentication failure" | tail -n 5 >> "$REPORT"
else
    echo -e "\n[!] $AUTHLOG not found. Skipping sudo failure check." >> "$REPORT"
fi

# Kernel/system warnings
echo -e "\n⚠️ System/kernel errors:" >> "$REPORT"
dmesg 2>/dev/null | grep -i "error\|warn\|fail" | tail -n 5 >> "$REPORT"

# Disk space alerts
echo -e "\n💾 Disk usage (>90%):" >> "$REPORT"
df -h | awk '$5+0 > 90 {print $0}' >> "$REPORT"

# Email alert if anomalies found
if grep -q -i "Failed password\|authentication failure\|error\|warn" "$REPORT"; then
    if command -v mail >/dev/null; then
        mail -s "🚨 LogSentinel Alert - $HOSTNAME" "$ALERT_EMAIL" < "$REPORT"
    else
        echo -e "\n[!] 'mail' command not found. Cannot send email alert." >> "$REPORT"
    fi
fi

# Save report to logs directory
cp "$REPORT" "logs/logsentinel_$(date '+%Y%m%d_%H%M%S').log"
