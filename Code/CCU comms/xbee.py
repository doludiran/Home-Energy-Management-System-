import serial

class Xbee():
    def __init__(self, port = "/dev/ttyS0", baudrate=9600):
        self.serial = serial.Serial(port = port, baudrate=baudrate)
        to_send1 =[0x42]
        self.serial.write(serial.to_bytes(to_send1))
    
    def send(self, data, address=0x00DE, frameid = 0x01, options=0x00):
        if not data:
            return 0
        message = '7E 00 {:02X} 01 {:02X} {:02X} {:02X} {:02X}'.format(
            len(data) + 5, frameid, (address & 0xFF00) >> 8, address & 0xFF, options
            )

        frame = bytearray.fromhex(message)
        frame.extend(data)

        frame.append(0xFF - sum(frame[3:]) & 0xFF)

        #print("Tx: " + self.format(frame))
        return self.serial.write(frame)

    def recieve(self):
        message = []
        i =0
        if (self.serial.read() == bytes(b'\x7E')):
            message.append('7e')
            while (i < 10):
                msg = self.serial.read().encode("hex")
                message.append(msg)
                i += 1
            data = message[8] + message[9]
            int_data =int(data, 16)
        print(int_data)
                
        



