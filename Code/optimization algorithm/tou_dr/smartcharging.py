from dropt import dropt
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# read .csv
mp = pd.read_csv("hourlyprice3.csv",header=None)
# convert dataframe to array 
price1 = mp.values
price = np.transpose(price1)
t_start="1:25" 
t_complete="16:20" 
p_rated = 10 # rated power kW
energy = 50 # the energy needed, kWh

load_profile = dropt(price, p_rated, energy, t_start, t_complete)

n = np.size(price)    
min_per_k = 1440/n
payment = np.sum(load_profile*price) * min_per_k /60
print(payment)

#print(payment)


plt.plot(price1)
x_skip = 4;
plt.xticks(np.arange(0, n+1, step=x_skip*(60/min_per_k)), np.arange(0, 25, step=x_skip))
plt.title('price')
plt.figure()
plt.plot(load_profile)
plt.xticks(np.arange(0, n+1, step=x_skip*(60/min_per_k)), np.arange(0, 25, step=x_skip))


