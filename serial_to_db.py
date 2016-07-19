# Project: Wireless Patient Monitoring System
# Author: William Ngeow
# Date: 18/7/2016
# Modified from https://www.youtube.com/watch?v=9Pde26llc7s

# import MySQLdb
import serial
import time

ser = serial.Serial('/dev/ttyACM0', 9600)
# db = MySQLdb.connect("localhost", "test", "pass", "temp") 
# cursor = db.cursor()
filename = "ard_log.txt"

text_file = open(filename, "w")
text_file.close()

def file_length(name):
    with open(name) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

while 1:
    line = ser.readline()

    #x = ser.readline()
    #time.sleep(1)
    #y - ser.readline()
    #time.sleep(1)
    #z = ser.readline()
    #time.sleep(1)
    #print(x)
    #print(y)
    #print(z)

    text_file = open(filename, "a")
    text_file.write(line)
    text_file.close()

    length = file_length(filename)
    #print(length)
    print(line)

    if length > 20 :     # > because includes \n in the last line
        lines = open(filename).readlines()
        new_file = open(filename, 'w').writelines(lines[1:])
         
