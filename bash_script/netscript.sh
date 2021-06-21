#!/bin/sh
echo "Attention !!! It is recommended \
to run this script from root accounts"
#Would you like to do it now? \
#Please insert(y/n): "
#read quest
#if [$quest != 'y']
#	then 
#	echo ""
#fi
#input name or ID process 
echo "Input name or ID process: "
read name
#input number of lines to output
echo "Input number lines: "
read line
if [ "$name" = "" ]
	then	
		echo "Error:not input not found"
		exit 1
	else
	netstt=`netstat -tunapl | awk -v name=$name '$0 ~ name {print $5}' | cut -d: -f1 | sort | uniq -c | sort | tail -n$line |grep -oP '(\d+\.){3}\d+' | while read IP; do whois $IP | awk -F':' '/^Organization/ {print $2}'; done`
	echo $netstt
fi
