################################################################################
from kivy.lang import Builder
Builder.load_file("ccugui.kv")
from kivy.config import Config
Config.set('graphics', 'fullscreen', '0')

import os
os.environ['KIVY_GL_BACKEND'] = 'gl'
from kivy.app import App
from kivy.garden.matplotlib.backend_kivyagg import FigureCanvasKivyAgg
from kivy.uix.tabbedpanel import TabbedPanel
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.graphics import Color, Rectangle
from kivy.uix.behaviors import ButtonBehavior
from kivy.uix.image import Image
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.anchorlayout import AnchorLayout
from kivy.uix.gridlayout import GridLayout
from kivy.uix.button import Button
import matplotlib.pyplot as plt
import numpy as np
from kivy.properties import StringProperty
from kivy.clock import Clock
import datetime
import time
from dropt import dropt
import pandas as pd
import threading
import tou
import xbee
import tempsense
import RPi.GPIO as GPIO

heater = 12 
ac = 16


GPIO.setmode(GPIO.BCM)
GPIO.setup(heater, GPIO.OUT)
GPIO.setup(ac, GPIO.OUT)

GPIO.output(heater, GPIO.LOW)
GPIO.output(ac, GPIO.LOW)
################################################################################

class CCUGUI(ScreenManager):
    pass

################################################################################

class HomeScreen(Screen):
    minutes = 0
    date = StringProperty(str(datetime.date.today().strftime("%d %B, %Y")))
    time = StringProperty(str(time.strftime('%H:%M', time.gmtime(minutes*60))))
    timeofusedata=[]
    
    def __init__(self, **kwargs):
        Screen.__init__(self, **kwargs)
        self.tou_data = tou.ToU()
        self.fig, self.ax = plt.subplots()
        self.fig_canvas = FigureCanvasKivyAgg(figure=self.fig)
        self.get_tou(1)
        self.data_graphs()
        self.ids.touplot.add_widget(self.fig_canvas)
        Clock.schedule_interval(self.clock, 1)
        Clock.schedule_interval(self.get_tou, 5)
        Clock.schedule_interval(self.data_graphs, 60)
    
    def clock(self, *args):
        if (self.minutes == 1440):
            self.minutes = 0
        self.minutes += 1
        self.time = str(time.strftime('%H:%M', time.gmtime(self.minutes*60)))
    
    def get_date(self, dt):
        self.date = str(datetime.date.today().strftime("%d %B, %Y"))
        self.time = str(datetime.datetime.now().strftime("%I:%M:%S %p"))
    
    def get_tou(self, dt):
        self.timeofusedata = self.tou_data.recieveTOU()
        
    def data_graphs(self, *args):
        
        size = 0.3
        out_size = 0.02
        angle = 15
        hours = 24
        hour_vals = [angle]*hours
        hour_labels = ['Midnight',1,2,3,4,5,6,7,8,9,10,11,'Noon',1,2,3,4,5,6,7,8,9,10,11]
        timeofday = [1, 1]
        timeofdaylabel= ['PM','AM']
        if (self.timeofusedata != 0):
            val = self.timeofusedata[0]
            inner_colors = self.timeofusedata[1]
            self.ids.onpeak.text = '[b]ON-PEAK : ' + self.timeofusedata[4] + '$/kWh[/b]'
            self.ids.offpeak.text ='[b]OFF-PEAK : ' + self.timeofusedata[5] + '$/kWh[/b]'
            self.ids.midpeak.text ='[b]MID-PEAK : '+ self.timeofusedata[6] + '$/kWh[/b]'
            
        else:
            val = [0,0,0,0]
            inner_colors = ['#f5f6fa']
        outer_colors = ['#f5f6fa']
        
        
        wedges, labels = self.ax.pie(hour_vals, radius=1, colors=outer_colors, labels=hour_labels,
                                startangle=97.5, counterclock=False,labeldistance =1.05,
                                wedgeprops=dict(width=out_size, edgecolor='w'))
        for label in labels:
            label.set_horizontalalignment('center')
            label.set_size('smaller')
    
        self.ax.pie(val, radius=1-out_size-0.01, colors=inner_colors, startangle=90,
                                       counterclock=False, wedgeprops=dict(width=size, edgecolor='w'))
                                    
        wedge_s,label_s =  self.ax.pie(timeofday, radius=1-out_size-size-0.025, labels = timeofdaylabel, colors=['#353b48', '#dcdde1'], startangle=90,
                                                              textprops = ({'weight': 'bold'}),labeldistance =0.4, wedgeprops=dict(width=0.1, edgecolor='w'))
        for label in label_s:
            label.set_size('large')
                                                                      
            self.ax.set(aspect="equal")
            self.fig.canvas.draw_idle()
        
        
        
################################################################################

class MenuScreen(Screen):
    pass

################################################################################

class EVScreen(Screen):
    charging = False
    isCharging = False
    turn_on = [0x58,0x90]
    turn_off = [0x58,0x99]
    recieve = [0x58,0x00]
    dr_override = False
    isoverride = False
    price =[0]
    currvolt=[0,0]
    power = 0
    dailyusage = []
    powerconsumption = np.zeros(1440)
    totalCost =0
    totalEnergy = 0
    priceperMin = np.zeros(1440)
    
    
    def __init__(self, **kwargs):
        Screen.__init__(self, **kwargs)
        self.price_power_fig, self.price_plot = plt.subplots()
        self.consumption_plot = self.price_power_fig.add_subplot(111, sharex=self.price_plot, frameon=False)
        self.price_power_canvas = FigureCanvasKivyAgg(figure=self.price_power_fig)
        self.pricepwrPlot()
        self.xbee = xbee.Xbee("/dev/ttyS0")
        self.ids.consdata.add_widget(self.price_power_canvas)
        self.totalMonthconsumptionPlot()
        self.ids.monthly.add_widget(FigureCanvasKivyAgg(plt.gcf()))
        Clock.schedule_interval(self.evCharging, 0.5)
        Clock.schedule_interval(self.get_power, 0.7)
        Clock.schedule_interval(self.calCost, 1)
        Clock.schedule_interval(self.pricepwrPlot, 15)
    
    def evCharging(self, *args):
        minutes = self.manager.get_screen("Home").minutes
        is_scheduled = self.manager.get_screen("sched").is_scheduled
        load_profile = self.manager.get_screen("sched").load_profile
        p_rated = self.manager.get_screen("sched").p_rated
        tou = self.manager.get_screen("Home").timeofusedata
        if(tou != 0):
            self.price = tou[2]
            self.priceperMin = tou[3]
        
        
        if (self.dr_override == True) and (self.charging == False):
            self.dr_override = False
            self.xbee.send(data=self.turn_on)
            self.charging = True
            self.ids.charge.text = 'Charging'
            self.ids.overide.text = 'Turn Off'
            if(is_scheduled == True):
                self.isoverride = True
            
        
        if (self.dr_override == True) and (self.charging == True):
            self.dr_override = False
            self.xbee.send(data=self.turn_off)
            self.charging = False
            self.ids.charge.text = 'Not Charging'
            self.ids.overide.text = 'Turn On'
            if(is_scheduled == True):
                self.isoverride = True
          
        
        if ((is_scheduled == True) and (self.isoverride == False)):
            if (minutes%15 == 0):
                i = int(minutes/15)
                print(minutes)
                print(i)
                if (i != 96): 
                    if ((load_profile[i] > 5) and (self.charging == False)):
                        print(int(load_profile[i]))
                        self.xbee.send(self.turn_on)
                        self.charging = True
                        self.ids.charge.text = 'Charging'
                        self.ids.overide.text = 'Turn Off'
                    
                    elif ((load_profile[i] < 5) and (self.charging == True)):
                        print(int(load_profile[i]))
                        self.xbee.send(self.turn_off)
                        self.charging = False
                        self.ids.charge.text = 'Not Charging'
                        self.ids.overide.text = 'Turn On'
                

                    
    
        
    def pricepwrPlot(self, *args):
        if (len(self.dailyusage) == 96):
            self.dailyusage = []
            self.price_power_canvas.canvas.clear()
            self.totalCost = 0
            self.totalEnergy = 0
            
        self.price_power_canvas.canvas.clear()    
        self.dailyusage.append(self.power)
        self.price_plot.plot(self.price, color='orange', linewidth=2, label= 'Price')
        x_skip = 4;
        n = 96
        min_per_k = 1440/n
        plt.xticks(np.arange(0, n+1, step=x_skip*(60/min_per_k)), np.arange(0, 25, step=x_skip))
        self.consumption_plot.plot(self.dailyusage, color = '#4c8a4c', linewidth=2, label='Power Consumption')
        self.consumption_plot.yaxis.tick_right()
#        self.price_plot.legend(loc='best')
#        self.consumption_plot.legend(loc='best')
#        self.price_plot.set_ylabel('$/kWh')
#        self.price_plot.set_xlabel('Hours')
#        self.consumption_plot.set_xlabel('Hours')
#        self.consumption_plot.set_ylabel('kW')
#        self.consumption_plot.yaxis.tick_right()
        
        self.price_plot.spines['top'].set_visible(False)
        self.price_plot.spines['right'].set_visible(False)
        self.price_plot.spines['bottom'].set_visible(False)
        self.price_plot.spines['left'].set_visible(False)
        self.price_plot.yaxis.grid(True)
        self.price_plot.tick_params(top='off', bottom='off', left='off', right='off', labelleft='on', labelbottom='on')
        self.consumption_plot.tick_params(top='off', bottom='off', left='off', right='off', labelleft='off', labelbottom='on')
        self.consumption_plot.set_ylim(ymin=0, ymax= 2.5)
        self.price_power_canvas.draw_idle()
        
        
        
    def totalMonthconsumptionPlot(self, *args):
        plt.figure()
        
        Month = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
        Energy = [50,30,40,45,50,65,60,43,23,40,11,
                  50,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        position = np.arange(len(Month))
        
        mybars = plt.bar(position, Energy, align ='center', linewidth =0)
        plt.xticks(position, Month)
        
        plt.title('Monthly')
        
        for spine in plt.gca().spines.values():
            spine.set_visible(False)
            
        plt.tick_params(top='off', bottom='off', left='off', right='off', labelleft='off', labelbottom='on')
        
        for bari in mybars:
            height = bari.get_height()
            plt.gca().text(bari.get_x() + bari.get_width()/2, bari.get_height()- 0.2, str(int(height)),
                           ha='center', color='white', fontsize=5)

    
    def get_power(self, dt=1):
        self.currvolt = self.xbee.recieve()
#        if(self.currvolt == [0xffff, 0xfff1]):
           
        if (self.currvolt != 0):
            print(self.currvolt)
            currtemp = self.currvolt[0]/1000
            volttemp = self.currvolt[1]/1000
        
            current = 28.123*(currtemp) + 0.0517
            voltage = 177.13*(volttemp**3) -  138.54*(volttemp**2) + 118.35*(volttemp) + 0.0193
            self.power = (current*voltage)/1000
            self.power = round(self.power, 2)
            print(self.power)
            self.ids.powerdis.text = '\r\r\r Live Usage: \n' + '      ' + str(self.power) + 'kW'
    
    def calCost(self, *args):
        minutes = self.manager.get_screen("Home").minutes
        self.powerconsumption[minutes-1] = self.power
        self.totalCost = np.sum(self.powerconsumption*self.priceperMin)/60
        self.totalEnergy =np.sum(self.powerconsumption)/60
        self.totalCost = round(self.totalCost, 2)
        self.totalEnergy = round(self.totalEnergy, 2)
        self.ids.tusage.text = 'Total Usage: ' + str(self.totalEnergy) + 'kWh'
        self.ids.tcost.text = 'Total Cost: ' + str(self.totalCost) + '$'
        
        

################################################################################

class schedule(Screen):
    is_scheduled = False
    price = []
    p_rated = 10 # rated power kW
    energy = 50 # the energy needed, kWh
    load_profile = []
    t_start = ''
    t_complete= ''
    
    def submitSchedule(self, *args):
        tou = self.manager.get_screen("Home").timeofusedata
        if(tou != 0):
            self.price = tou[2]
            print(len(self.price))
            price1 = pd.DataFrame(self.price)
            price2 =price1.values
            newprice = np.transpose(price2)
        else:
            newprice = 0
        
        if ((len(self.ids.starttime.text) == 5) and (len(self.ids.deadline.text) == 5)):
            self.t_start = self.ids.starttime.text
            self.t_complete = self.ids.deadline.text
            self.load_profile = dropt(self.price, self.p_rated, self.energy, self.t_start, self.t_complete)
            self.is_scheduled = True
            self.ids.notification.text  = "Charging Scheduled"
            print(self.is_scheduled)
            print(self.load_profile)
        else:
            if (len(self.ids.starttime.text) != 5):
                self.ids.notification.text  = "Enter a Valid Start Time"
            if (len(self.ids.deadline.text) != 5):
                self.ids.notification.text  = "Enter a Valid Deadline"
    


    def deleteSchedule(self, *args):
        self.load_profile = []
        self.is_scheduled = False
        self.t_start = self.ids.starttime.text = ''
        self.t_complete = self.ids.deadline.text = ''
        self.ids.notification.text  = "No Schedule"
    
    def keypadInput(self, button):
        if button.text.isdigit():
            if (((self.active_text) == 'starttime') or ((self.active_text) == 'deadline')):
                if(len(self.ids[self.active_text].text) < 5 ):
                    if ((len(self.ids[self.active_text].text) == 0) and (int(button.text) <= 2)):
                        self.ids[self.active_text].text += button.text
                        self.ids.notification.text = ""
                    elif ((len(self.ids[self.active_text].text) == 1) and (self.ids[self.active_text].text[0] == '2')
                          and (int(button.text) <= 3)):
                        self.ids[self.active_text].text += button.text
                        self.ids[self.active_text].text += ':'
                        self.ids.notification.text = ""
                    elif ((len(self.ids[self.active_text].text) == 1) and (self.ids[self.active_text].text[0] != '2')):
                        self.ids[self.active_text].text += button.text
                        self.ids[self.active_text].text += ':'
                        self.ids.notification.text = ""
                    elif ((len(self.ids[self.active_text].text) == 3) and (int(button.text) <= 5)):
                        self.ids[self.active_text].text += button.text
                        self.ids.notification.text = ""
                    elif ((len(self.ids[self.active_text].text) == 4) and (int(button.text) <= 9)):
                        self.ids[self.active_text].text += button.text
                        self.ids.notification.text = ""
                    else:
                        self.ids.notification.text = "Invalid!!!"
    
        else:
            self.ids[self.active_text].text = ""

################################################################################

class ThermostatScreen(Screen):
    currenttemp = 0;
    setpoint = 0
    demand_response = False
    deadbeatval = 1
    
    def __init__(self, **kwargs):
        Screen.__init__(self, **kwargs)
        #self.sensor = tempsense.Sensor()
        #Clock.schedule_interval(self.control_temp, 2)
        
    def cool_mode(self, *args):
        colour = [0,0.6588,1,1]
        btn_colour = [0, 1.3176, 2, 1]
        self.ids.thermostat.colour = colour
        self.ids.thermostat.btn_colour = btn_colour
        self.ids.mode.text = 'Cooling'
    
    def heat_mode(self, *args):
        colour = [2,0,0,1]
        btn_colour = [2.5,0,0,1]
        self.ids.thermostat.colour = colour
        self.ids.thermostat.btn_colour = btn_colour
        self.ids.mode.text = 'Heating'
    
    def therm_inc_dec(self, button):
        if ((int(self.ids.settemp.text) >= 15) and (int(self.ids.settemp.text) <= 35)):
            if(button.name == 'increase'):
                if(int(self.ids.settemp.text) != 35):
                    self.ids.settemp.text = str(int(self.ids.settemp.text)+1)
            elif(button.name == 'decrease'):
                if(int(self.ids.settemp.text) != 15):
                    self.ids.settemp.text = str(int(self.ids.settemp.text)-1)
    
    #def demand_res(self, *args):
        
    
#    def control_temp(self, *args):
#        self.setpoint = int(self.ids.settemp.text)
#        self.currenttemp =self.sensor.recieveTemp()
#        
#        self.ids.current.text = str(self.currenttemp)
#        
#        if(self.ids.mode.text == 'Heating'):
#            if((self.setpoint-self.currenttemp) >= self.deadbeatval):
#                #turn on heater
#                GPIO.output(heater, GPIO.HIGH)
#            elif((self.currenttemp-self.setpoint) >= self.deadbeatval):
#                #turnoff heater
#                GPIO.output(heater, GPIO.LOW)
#        if(self.ids.mode.text == 'Cooling'):
#            if((self.currenttemp-self.setpoint) >= self.deadbeatval):
#                #turn on ac
#                GPIO.output(ac, GPIO.HIGH)
#            elif((self.setpoint-self.currenttemp) >= self.deadbeatval):
#                #turnoff ac
#                GPIO.output(ac, GPIO.HIGH)
            
            
################################################################################

class CCUgraphicUI(App):
    def build(self):
        parent = CCUGUI()
        parent.add_widget(HomeScreen(name='Home'))
        parent.add_widget(MenuScreen(name='Menu'))
        parent.add_widget(EVScreen(name='EV'))
        parent.add_widget(ThermostatScreen(name='Thermostat'))
        parent.add_widget(schedule(name='sched'))
        return parent

################################################################################

if __name__ == "__main__":
    CCUgraphicUI().run()




