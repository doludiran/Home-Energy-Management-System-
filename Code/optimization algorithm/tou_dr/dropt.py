def dropt(price, p_rated, energy, t_start, t_complete):
    import cvxpy as cp
    import numpy as np

    n = np.size(price)    
    min_per_k = 1440/n
    
    k_start = t2k(t_start, min_per_k)
    k_complete = t2k(t_complete,min_per_k)
      
    penalty = list(range(0,n))

    energy = energy*60/min_per_k # convert kWh to kW min_per_k
    # possible usage time
    if(k_start<k_complete):        
        a = np.zeros(k_start)
        b = np.ones(k_complete-k_start)
        c = np.zeros(n-k_complete)
        
        k_usage = np.concatenate((a, b, c))
   
    # Construct the problem.
    # q is the power of the appliance
    q = cp.Variable(n)
    cp.sum
    objective = cp.Minimize(price*q + cp.sum(q*penalty))
    constraints = [0 <= q, q <= p_rated, k_usage*q==energy]
    prob = cp.Problem(objective, constraints)
    
    # The optimal objective value is returned by `prob.solve()`.
    prob.solve()
    return q.value

def t2k(t_str,min_per_k):
    import math 
    tmp = t_str.split(':')
    tmp1 = int(tmp[0])
    tmp2 = int(tmp[1])
    k = math.floor((tmp1*60+tmp2)/min_per_k)
    return k
