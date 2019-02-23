import serial

class Xbee():
    def __init__(self, port = "/dev/tty.usbserial-14410", baudrate=9600):
        self.serial = serial.Serial(port = port, baudrate=baudrate)
        to_send1 =[0x42]
        self.serial.write(serial.to_bytes(to_send1))
    
    def send(self, data, address, frameid = 0x01, options=0x00):
        if not data:
            return 0
        message = '7E 00 {:02X} 01 {:02X} {:02X} {:02X} {:02X}'.format(
            len(data) + 5, frameid, (address & 0xFF00) >> 8, address & 0xFF, options
            )

        frame = bytearray.fromhex(message)
        frame.extend(data)

        frame.append(0xFF - sum(frame[3:]) & 0xFF)

        print("Tx: " + self.format(frame))
        return self.serial.write(frame)

    def recieve(self):
        message = []
        i = 0
        if (self.serial.read() == 0x7E)
            for i < 11
                message.append(self.serial.read())
                i+=1
        return message



