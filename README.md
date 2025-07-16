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

LogSentinel/

├── logs/                          # Archived reports saved here
│   └── logsentinel_*.log          # (auto-generated) timestamped reports
│
├── test/                          # Sample logs for testing
│   └── sample_syslog.log
│
├── .gitignore                     # Ignore env files, logs, etc.
├── config.env                     # Configuration (email, thresholds)
├── monitor.sh                     # Main script that scans logs
├── setup_cron.sh                  # Helper script to schedule monitor.sh
├── logsentinel.sh                 # 🔹 CLI menu interface (new)
├── README.md                      # Project overview and usage guide



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
