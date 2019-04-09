#################################################################################
# Name: xbee.py                                                                 #
# Description: Xbee Communinication module                                      #
# Version: V1.1                                                                 #
# Author: Damilola Oludiran                                                     #
#                                                                               #
#                                                                               #
# This software is supplied "AS IS" without warranties of any kind.             #
#                                                                               #
#----------------------------------------------------------------------------   #
# History:                                                                      #
#            V1.0 Initial Version by Damilola Oludiran                          #
#            V1.1 Changed implementation to threaded class by Damilola Oludiran #
#                                                                               #
#################################################################################

#################################################################################
# Imports                                                                       #
#################################################################################
import serial
import threading
import queue as Queue
from time import sleep

#################################################################################
# Xbee Thread Class                                                             #
#################################################################################
class Xbee(threading.Thread):
    rxQueue = Queue.Queue(maxsize=1)
    stop = threading.Event()
    rx = True
    
    #################################################################################
    # Name: __init__                                                                #
    # Parameters: self                                                              #
    # Description: This method initialises the thread and serial interface          #
    #                with xbee                                                      #
    # Preconditions: The xbee circuit is connected                                  #
    # Postconditions: Thread starts, xbee is initialized                            #
    #################################################################################
    def __init__(self, port = "/dev/ttyS0", baudrate=9600):
        threading.Thread.__init__(self)
        self.serial = serial.Serial(port = port, baudrate=baudrate)
        to_send1 =[0x42]
        self.serial.write(serial.to_bytes(to_send1))
        self.start()
    
    #################################################################################
    # Name: shutdown                                                                #
    # Parameters: self                                                              #
    # Description: This method terminates the thread                                #
    # Preconditions:n/a                                                             #
    # Postconditions: Thread stops running                                          #
    #################################################################################
    def shutdown(self):
        self.stop.set()
        self.join()
    
    #################################################################################
    # Name: run                                                                     #
    # Parameters: self                                                              #
    # Description: This method is the thread's main loop                            #
    # Preconditions: n/a                                                            #
    # Postconditions: Continuously retrieves xbee data                              #
    #################################################################################
    def run(self):
        while not self.stop.is_set():
            self.Rx()
            
            

    #################################################################################
    # Name: recieve                                                                 #
    # Parameters: self                                                              #
    # Description: This method returns the current and voltage data                 #
    # Preconditions: rxQueue is initialised                                         #
    # Postconditions: returns queue data if any                                     #
    #################################################################################
    def recieve(self):
        if not self.rxQueue.empty():
            return self.rxQueue.get()
        else:
            return 0

    #################################################################################
    # Name: send                                                                    #
    # Parameters: self                                                              #
    # Description: This method sends data over serial                               #
    #                                                                               #
    # Preconditions: xbee is initialised                                            #
    # Postconditions: data is sent                                                  #
    #################################################################################
    def send(self, data, address=0xFFFF, frameid = 0x00, options=0x00):
        if not data:
            return 0
        message = '7E 00 {:02X} 01 {:02X} {:02X} {:02X} {:02X}'.format(
            len(data) + 5, frameid, (address & 0xFF00) >> 8, address & 0xFF, options
            )

        frame = bytearray.fromhex(message)
        frame.extend(data)

        frame.append(0xFF - sum(frame[3:]) & 0xFF)

        return self.serial.write(frame)

    #################################################################################
    # Name: Rx                                                                      #
    # Parameters: self                                                              #
    # Description: This method recieves data from serial interface                  #
    # Preconditions: xbee is initialised                                            #
    # Postconditions: data is recieved, if any                                      #
    #################################################################################
    def Rx(self):
        message = []
        i = 0
        start = self.serial.read() 
        if (start.hex() == '7e'):
            message = self.serial.read(12)
            print(message.hex())
            if (message[4] == 0xde):
                current = ((message[7] & 0x00FF) << 8) + message[8]
                voltage = ((message[9] & 0x00FF) << 8) + message[10]
                data =[current, voltage]
                self.rxQueue.put(data)




