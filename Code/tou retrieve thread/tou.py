import threading
import queue as Queue
from time import sleep
import requests
import json
import pandas as pd
import datetime as DT

Total_Daily_Minutes =1440
DR_interval = 15
minutes = 60

class ToU(threading.Thread):
    rxQueue = Queue.Queue()
    stop = threading.Event()
    
    def __init__(self):
        threading.Thread.__init__(self)
        self.start()
    
    def shutdown(self):
        self.stop.set()
        self.join()
    
    def run(self):
        while not self.stop.is_set():
            self.getToU()
            sleep(0.01)
    
    def recieveTOU(self):
        try:
            return self.rxQueue.get(timeout=5)
        except Queue.Empty:
            return None
    
    def converttomins(self, timevalue, timeformat):
        t1 = DT.datetime.strptime(timevalue, timeformat)
        t2 = DT.datetime(1900,1,1)
        totalminutes = (t1-t2).total_seconds()/minutes
        return totalminutes

    def retrieveToU(self):
        tou=requests.get('http://www2.cs.uregina.ca/~joshi26a/utility portal/tou_json/tou_json.json').json()
        tou_d = tou[0]
        i = 1
        tou_df = []
        while i < len(tou_d):
            tou_df.append(tou_d[i])
            i+=1
        
        i = 0
        while i < len(tou_df):
            totalFromminutes = self.converttomins(tou_df[i]['TOU From'], '%H:%M:%S')
            totalTominutes = self.converttomins(tou_df[i]['TOU To'], '%H:%M:%S')
            if (i == (len(tou_df) - 1 ) and (tou_df[i]['TOU To'] == '00:00:00')):
                diff = Total_Daily_Minutes-totalFromminutes
            else:
                diff = abs(totalTominutes - totalFromminutes)
            diff = diff/DR_interval
            tou_df[i]['Total Minutes'] = diff
            i+=1
        return tou_df

    def getToU(self):
        
        data = self.retrieveToU()
        
        price = []
        time_of_use = []
        tou_data = []
        plotdata = []
        i = 0
        while i < len(data):
            j = 0
            max = int(data[i]['Total Minutes'])
            while j < max:
                price.append(int(data[i]['TOU Price']))
                j+=1
            if (data[i]['TOU Period'] == 'ON-Peak'):
                time_of_use.append('#e74c3c')
            elif (data[i]['TOU Period'] == 'MID-Peak'):
                time_of_use.append('#e7a23c')
            elif (data[i]['TOU Period'] == 'OFF-Peak'):
                time_of_use.append('#2ecc71')
            
            plotdata.append(max)
            i+=1
        tou_data.append(plotdata)
        tou_data.append(time_of_use)
        tou_data.append(price)
        self.rxQueue.put(tou_data)



