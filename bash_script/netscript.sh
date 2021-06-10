#!/bin/sh
#input name or pid process
echo "This script running with root privileges"
#read -p "Execute with sudo ?":yes
#input name or ID process
read -p "Input name or ID process:" procid
echo `netstat -tunapl | awk -v procid=$procid '{print $5}' | cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done`
