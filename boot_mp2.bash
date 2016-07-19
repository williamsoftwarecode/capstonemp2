#! /bin/sh

# Project: Wireless Patient Monitoring System
# Author: William Ngeow
# Date: 18/7/2016

sudo apt-get update
sudo apt-get install tightvncserver
sudo apt-get install xtightvncviewer

sudo apt-get install arduino
sudo apt-get install minicom
sudo apt-get install python-matplotlib

sudo tightvncserver
vncserver :2 -geometry 1920x1080 -depth 24 
hostname -I
 


