# 🐧 LogSentinel

> A Bash-based UNIX log monitoring system that detects anomalies and sends alerts.

## 🚀 Features

- Detects failed SSH login attempts
- Sudo authentication failures
- Kernel or system errors from `dmesg`
- Disk space usage alerts
- Email notifications with log reports
- Cron job support for automation

## 📂 Structure

logsentinel/
├── monitor.sh
├── config.env
├── setup_cron.sh
├── logs/
└── test/


## 🔧 Setup

1. Clone the repo
2. Update `config.env` with your email
3. Make scripts executable:


## How to run (commands)
cat /tmp/logsentinel_report.txt

ls logs/
cat logs/logsentinel_(Get-digits-from-terminal).log

cp test/sample_syslog.log /tmp/fake_auth.log
AUTHLOG="/tmp/fake_auth.log" (Change to this for temproary)
bash monitor.sh
cat /tmp/logsentinel_report.txt
ls logs/


## 🔧 Usage via CLI Menu

Use the interactive CLI to run scans and check reports:

```bash
chmod +x logsentinel.sh
./logsentinel.sh
