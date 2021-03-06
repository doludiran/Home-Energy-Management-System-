import serial
import threading
import queue as Queue
from time import sleep

class Xbee(threading.Thread):
    rxQueue = Queue.Queue()
    stop = threading.Event()
    rx = True
    
    def __init__(self, port = "/dev/tty.usbserial-14410", baudrate=9600):
        threading.Thread.__init__(self)
        self.serial = serial.Serial(port = port, baudrate=baudrate)
        to_send1 =[0x42]
        self.serial.write(serial.to_bytes(to_send1))
        self.start()
    
    def shutdown(self):
        self.stop.set()
        self.join()
    
    def run(self):
        while not self.stop.is_set():
            self.Rx()
            sleep(0.01)
    
    def recieve(self):
        try:
            return self.rxQueue.get(timeout=5)
        except Queue.Empty:
            return None

    def send(self, data, address=0x00DE, frameid = 0x01, options=0x00):
        if not data:
            return 0
        message = '7E 00 {:02X} 01 {:02X} {:02X} {:02X} {:02X}'.format(
            len(data) + 5, frameid, (address & 0xFF00) >> 8, address & 0xFF, options
            )

        frame = bytearray.fromhex(message)
        frame.extend(data)

        frame.append(0xFF - sum(frame[3:]) & 0xFF)

        return self.serial.write(frame)

    def Rx(self):
        message = []
        i = 0
        if (self.serial.read() == b'\x7E'):
            message = self.serial.read(12)
            print(message.hex())
            current = ((message[7] & 0x00FF) << 8) + message[8]
            voltage = ((message[9] & 0x00FF) << 8) + message[10]
            data =[current, voltage]
            self.rxQueue.put(data)




