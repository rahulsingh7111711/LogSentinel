#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

while true; do
    echo -e "\n${YELLOW}============================"
    echo "🛡️  LogSentinel CLI Menu"
    echo -e "============================${NC}"
    echo "1. Run Live System Scan"
    echo "2. View Latest Report"
    echo "3. List Archived Reports"
    echo "4. Exit"
    read -p "👉 Choose an option [1-4]: " choice

    case $choice in
        1)
            echo -e "${YELLOW}🔄 Running system scan...${NC}"
            bash monitor.sh
            echo -e "${GREEN}✅ Scan complete. Report saved to /tmp/logsentinel_report.txt${NC}"
            ;;
        2)
            if [ -f /tmp/logsentinel_report.txt ]; then
                echo -e "${YELLOW}📄 Showing latest report:${NC}"
                echo "-----------------------------"
                cat /tmp/logsentinel_report.txt
            else
                echo -e "${RED}⚠️  No recent report found. Run a scan first.${NC}"
            fi
            ;;
        3)
            echo -e "${YELLOW}🗂 Archived Reports:${NC}"
            ls -1 logs/logsentinel_*.log 2>/dev/null || echo -e "${RED}❌ No archived logs found.${NC}"
            ;;
        4)
            echo -e "${GREEN}👋 Exiting LogSentinel. Goodbye!${NC}"
            break
            ;;
        *)
            echo -e "${RED}❗ Invalid option. Please try again.${NC}"
            ;;
    esac
done
