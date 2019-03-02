import xbee
from time import sleep

if __name__ == "__main__":
    xbee = xbee.Xbee("/dev/ttyS0")
    data = [0x58, 0x90]
    # A simple string message
    

while True:
#    xbee.send(data)
#    sleep(0.25)
#    rx =xbee.serial.read()
#    print(rx)

    xbee.recieve()
#    print(message)
    sleep(0.25)

