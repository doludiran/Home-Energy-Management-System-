import threading
import queue as Queue
import time
from w1thermsensor import W1ThermSensor

class Sensor(threading.Thread):
    rxQueue = Queue.Queue()
    stop = threading.Event()
    
    def __init__(self):
        threading.Thread.__init__(self)
        self.sensor = W1ThermSensor()
        self.start()
    
    def shutdown(self):
        self.stop.set()
        self.join()
    
    def run(self):
        while not self.stop.is_set():
            self.getTemp()
            time.sleep(0.1)
    
    def recieveTemp(self):
        if not self.rxQueue.empty():
            return self.rxQueue.get()
        else:
            return 0
    
    def getTemp(self):
        temperature = self.sensor.get_temperature()
        self.rxQueue.put(temperature)

