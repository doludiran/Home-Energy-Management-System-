import xbee
from time import sleep

if __name__ == "__main__":
    xbee = xbee.Xbee("/dev/tty.usbserial-14510")
    data = [0x45, 0x32]
    # A simple string message
    sent = xbee.send(data)
    sleep(0.25)

while True:

    message = xbee.recieve()
    print(message)
    sleep(0.25)

