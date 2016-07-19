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
            xar = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50]
            
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
    plt.ylim([440,500])    # fix the axis range (otherwise, it automatically fits window 
    #yar = []
ani = animation.FuncAnimation(fig, animate, interval=50)
plt.show()

