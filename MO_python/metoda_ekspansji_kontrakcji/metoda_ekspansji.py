import numpy as np
import matplotlib.pyplot as plt


def ekspansion_method(x0,x1,f,alpha,N_max):
    i = 0
    f_ = lambda x:f(x + x0)
    x_1 = 0
    x_0 = 0
    if f_(x_0) == f_(x1):
        return x_0 + x0,x1 + x0,i
    if f_(x1) > f_(x_0):
        x1 = -x1
        if f_(x1) >= f_(x_0):
            return x1 + x0,-x1 + x0,i
    while f_(x_0) > f_(x1):
        if i > N_max:
            return "error"
        i += 1
        x_1 = x_0
        x_0 = x1
        x1 = alpha * x1
        # plt.plot(np.linspace(-20,20,10000),f_(np.linspace(-20,20,10000)))
        # plt.plot([x_0,x1,x_1],[0,0,0],'*r')
        # plt.show()
    if x_1< x1:
        return x_1 + x0,x1 + x0,i
    return x1  + x0,x_1 + x0,i
    pass

