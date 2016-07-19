#! /bin/sh

# Project: Wireless Patient Monitoring System
# Author: William Ngeow
# Date: 18/7/2016

vncserver :2 -geometry 1920x1080 -depth 24 
hostname -I

sudo minicom -C test.txt