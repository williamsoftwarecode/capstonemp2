#! /bin/bash

# Project: Wireless Patient Monitoring System
# Author: William Ngeow
# Date: 18/7/2016

timestamp=`date +%F_%H-%M-%S`
filename="temp_log_$timestamp.txt"
echo >> $filename
echo "Raspberry Pi Processor Temperature Log - $(date)" > $filename

while :
do
	temp=`/opt/vc/bin/vcgencmd measure_temp`
	echo -n `date +%F_%H-%M-%S` >> $filename
	echo -n ": " >> $filename
	echo ${temp:5:10} >> $filename
	sleep 10
done