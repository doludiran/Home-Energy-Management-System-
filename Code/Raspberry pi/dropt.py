def dropt(price, p_rated, energy, t_start, t_complete):
    import numpy as np
    from scipy.optimize import minimize
    
    n = np.size(price)    
    min_per_k = 1440/n
    
    k_start = t2k(t_start, min_per_k)
    k_complete = t2k(t_complete,min_per_k)   

    energy = energy*60/min_per_k # convert kWh to kW min_per_k
    # possible usage time
    if(k_start<k_complete):        
        a = np.zeros(k_start)
        b = np.ones(k_complete-k_start)
        c = np.zeros(n-k_complete)
        
        k_usage = np.concatenate((a, b, c))
        
    def objective(x):
        pen = list(range(0,n))
        return np.sum(price*x+pen*x*0.01)
    def constraint1(x):    
        return np.sum(k_usage*x)-energy  
    
    cons = {'type': 'eq', 'fun': constraint1}
    bnds = ((0.0,p_rated),)*n    
    x0 = np.ones(n)
    sol = minimize(objective, x0, method='SLSQP', bounds=bnds, constraints=cons)  

    return sol.x
  
def t2k(t_str,min_per_k):
    import math 
    tmp = t_str.split(':')
    tmp1 = int(tmp[0])
    tmp2 = int(tmp[1])
    k = math.floor((tmp1*60+tmp2)/min_per_k)
    return k
