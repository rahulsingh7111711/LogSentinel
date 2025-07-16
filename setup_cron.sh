#!/bin/bash

CRON_JOB="*/15 * * * * $(pwd)/monitor.sh"

# Add to crontab
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "✅ LogSentinel scheduled to run every 15 minutes."
