# Project: Wireless Patient Monitoring System
# Author: William Ngeow
# Date: 18/7/2016
# Modified from https://pythonprogramming.net/python-matplotlib-live-updating-graphs/

import matplotlib.pyplot as plt
import matplotlib.animation as animation
import time

fig = plt.figure()
ax1 = fig.add_subplot(1,1,1)

def animate(i):
    pullData = open("ard_log.txt","r").read()
    dataArray = pullData.split('\n')
    xar = []
    yar = []
    count = 1;
    for eachLine in dataArray:
        if len(eachLine)>1:
            #x,y = eachLine.split(',')
            #xar.append(int(x))
            #yar.append(int(y))
            xar = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
            
            #if count < 5 :
            count = count+1;
            yar.append(eachLine)
            #else :
             #   count = 5;
                #yar[0] = yar[1]
                #yar[1] = yar[2]
                #yar[2] = yar[3]
                #yar[3] = yar[4]
               # yar = []
              #  yar.append(eachLine)
    ax1.clear()
    ax1.plot(xar,yar)
    #yar = []
ani = animation.FuncAnimation(fig, animate, interval=1000)
plt.show()
