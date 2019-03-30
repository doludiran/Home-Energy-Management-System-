import threading
import queue as Queue
import time
from w1thermsensor import W1ThermSensor

class Sensor(threading.Thread):
    rxQueue = Queue.Queue()
    self.sensor = W1ThermSensor()
    stop = threading.Event()
    
    def __init__(self):
        threading.Thread.__init__(self)
        self.start()
    
    def shutdown(self):
        self.stop.set()
        self.join()
    
    def run(self):
        while not self.stop.is_set():
            self.getTemp()
            sleep(1)
    
    def recieveTemp(self):
        try:
            return self.rxQueue.get(timeout=5)
        except Queue.Empty:
            return None
    
    def getTemp(self):
        temperature = self.sensor.get_temperature()
        self.rxQueue.put(temperature)

