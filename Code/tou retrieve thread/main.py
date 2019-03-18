import tou
from time import sleep

if __name__ == "__main__":
    data = tou.ToU()

while True:

    message = data.recieveTOU()
    print(message)
    sleep(0.25)

