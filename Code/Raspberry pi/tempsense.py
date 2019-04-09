#################################################################################
# Name: Tempsense.py                                                            #
# Description: Temperature Sensor Interface                                     #
# Version: V1.3                                                                 #
# Author: Damilola Oludiran                                                     #
#                                                                               #
#                                                                               #
# This software is supplied "AS IS" without warranties of any kind.             #
#                                                                               #
#----------------------------------------------------------------------------   #
# History:                                                                      #
#     V1.0 Initial Version by Damilola Oludiran                                 #
#     V1.1 Changed the sampling rate for temperature data by Damilola Oludiran  #
#     V1.2 Changed Implementation to threaded class by Damilola Oludiran        #
#     V1.3 Final Version by Damilola Oludiran                                   #
#################################################################################

#################################################################################
# Imports                                                                       #
#################################################################################
import threading
import queue as Queue
import time
from w1thermsensor import W1ThermSensor



#################################################################################
# Sensor Thread Class                                                           #
#################################################################################
class Sensor(threading.Thread):
    rxQueue = Queue.Queue()
    stop = threading.Event()

    #################################################################################
    # Name: __init__                                                                #
    # Parameters: self                                                              #
    # Description: This method initialises the thread and 1 wire interface          #
    #                with sensor                                                    #
    # Preconditions: The Temperature sensor circuit is connected                    #
    # Postconditions: Thread starts, sensor is initialized                          #
    #################################################################################

    def __init__(self):
        threading.Thread.__init__(self)
        self.sensor = W1ThermSensor()
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
    # Postconditions: Continuously retrieves temperature sensor data                #
    #################################################################################
    def run(self):
        while not self.stop.is_set():
            self.getTemp()
            time.sleep(1)

    #################################################################################
    # Name: recieveTemp                                                             #
    # Parameters: self                                                              #
    # Description: This method returns the current temperature                      #
    #                                                                               #
    # Preconditions: rxQueue is initialised                                         #
    # Postconditions: returns queue data if any                                     #
    #################################################################################
    def recieveTemp(self):
        if not self.rxQueue.empty():
            return self.rxQueue.get()
        else:
            return 0

    #################################################################################
    # Name: getTemp                                                                 #
    # Parameters: self                                                              #
    # Description: This method retrieves sensor data and puts it in a queue         #
    # Preconditions: sensor is connected and initialized                            #
    # Postconditions: Tsensor data is put in queue                                  #
    #################################################################################
    def getTemp(self):
        temperature = self.sensor.get_temperature()
        self.rxQueue.put(temperature)

