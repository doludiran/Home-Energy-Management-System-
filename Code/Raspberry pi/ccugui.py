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
#import xbee


################################################################################

class CCUGUI(ScreenManager):
    pass

################################################################################

class HomeScreen(Screen):
    minutes = 0
    date = StringProperty(str(datetime.date.today().strftime("%d %B, %Y")))
    time = StringProperty(str(time.strftime('%H:%M', time.gmtime(minutes*60))))
    
    
    def __init__(self, **kwargs):
        Screen.__init__(self, **kwargs)
        self.fig, self.ax = plt.subplots()
        self.fig_canvas = FigureCanvasKivyAgg(figure=self.fig)
        self.data_graphs()
        self.ids.touplot.add_widget(self.fig_canvas)
        Clock.schedule_interval(self.clock, 1)
        Clock.schedule_interval(self.data_graphs, 1440)
    
    def clock(self, *args):
        if (self.minutes == 1440):
            self.minutes = 0
        self.minutes += 1
        self.time = str(time.strftime('%H:%M', time.gmtime(self.minutes*60)))
    
    def get_date(self, dt):
        self.date = str(datetime.date.today().strftime("%d %B, %Y"))
        self.time = str(datetime.datetime.now().strftime("%I:%M:%S %p"))
    
    def data_graphs(self, *args):
        
        size = 0.3
        out_size = 0.02
        angle = 15
        hours = 24
        hour_vals = [angle]*hours
        hour_labels = ['Midnight',1,2,3,4,5,6,7,8,9,10,11,'Noon',1,2,3,4,5,6,7,8,9,10,11]
        timeofday = [1, 1]
        timeofdaylabel= ['PM','AM']
        val = [7,4,6,2,5]
        outer_colors = ['#f5f6fa']
        inner_colors = ['#e74c3c','#2ecc71']
        
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
    turn_on = [0x01]
    turn_off = [0x02]
    get_powerconsumption = [0x03]
    dr_override = False
    
    def __init__(self, **kwargs):
        Screen.__init__(self, **kwargs)
        self.price_power_fig, self.price_plot = plt.subplots()
        self.consumption_plot = self.price_power_fig.add_subplot(111, sharex=self.price_plot, frameon=False)
        self.price_power_canvas = FigureCanvasKivyAgg(figure=self.price_power_fig)
        self.pricepwrPlot()
        #self.xbee = xbee.Xbee("/dev/tty.usbserial-14410")
        self.ids.consdata.add_widget(self.price_power_canvas)
        self.totalMonthconsumptionPlot()
        self.ids.monthly.add_widget(FigureCanvasKivyAgg(plt.gcf()))
        Clock.schedule_interval(self.evCharging, 1)
        Clock.schedule_interval(self.pricepwrPlot, 1)
    
    def evCharging(self, *args):
        minutes = self.manager.get_screen("Home").minutes
        is_scheduled = self.manager.get_screen("sched").is_scheduled
        load_profile = self.manager.get_screen("sched").load_profile
        p_rated = self.manager.get_screen("sched").p_rated
        
        
        if (self.dr_override == True) and (self.charging == False):
            self.dr_override = False
            #self.xbee.send(self.turn_on)
            self.charging = True
            self.ids.charge.text = 'charging'
        
        if (self.dr_override == True) and (self.charging == True):
            self.dr_override = False
            #self.xbee.send(self.turn_off)
            self.charging = False
            self.ids.charge.text = 'not charging'
        
        if (is_scheduled == True):
            if (minutes%15 == 0):
                i = int(minutes/15)
                print(minutes)
                print(i)
                if ((int(load_profile[i]) == p_rated - 1) and (self.charging == False)):
                    print(int(load_profile[i]))
                    #self.xbee.send(self.turn_on)
                    self.charging = True
                    self.ids.charge.text = 'charging'
                
                elif ((int(load_profile[i]) != p_rated - 1) and (self.charging == True)):
                    print(int(load_profile[i]))
                    #self.xbee.send(self.turn_off)
                    self.charging = False
                    self.ids.charge.text = 'not charging'

    def pricepwrPlot(self, *args):
        
        self.price_plot.plot([1,3,4,5,2], color='orange', linewidth=4)
        x_skip = 4;
        n = np.size([1,3,4,5,2])
        min_per_k = 1440/n
        plt.xticks(np.arange(0, n+1, step=x_skip*(60/min_per_k)), np.arange(0, 25, step=x_skip))
        self.consumption_plot.plot([10,40,20,30,50], color = '#4c8a4c', linewidth=4)
        self.consumption_plot.yaxis.tick_right()
        
        self.price_plot.spines['top'].set_visible(False)
        self.price_plot.spines['right'].set_visible(False)
        self.price_plot.spines['bottom'].set_visible(False)
        self.price_plot.spines['left'].set_visible(False)
        self.price_plot.yaxis.grid(True)
        self.price_plot.tick_params(top='off', bottom='off', left='off', right='off', labelleft='on', labelbottom='on')
        self.consumption_plot.tick_params(top='off', bottom='off', left='off', right='off', labelleft='off', labelbottom='on')
        
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
#def powerConsumption(self, *args):
#   if (self.charging == True):
#      Xbee.send(get_powerconsumption)

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
        # read .csv
        mp = pd.read_csv("hourlyprice3.csv",header=None)
        # convert dataframe to array
        price1 = mp.values
        self.price = np.transpose(price1) # ToU price array
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




