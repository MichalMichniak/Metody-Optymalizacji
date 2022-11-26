import numpy as np
import matplotlib.pyplot as plt

lst_x = []
lst_y = []
def etap_probny(x,s,e,f):
    for j in range(len(e)):
        if f(x + s*e[j]) < f(x):
            x = x + s*e[j]
            lst_x.append(x[0])
            lst_y.append(x[1])
        else:
            if f(x - s*e[j]) < f(x):
                x = x - s*e[j]
                lst_x.append(x[0])
                lst_y.append(x[1])
    return x

def HJeeves(x,s,e,f,alpha,epsilon):
    while s>epsilon:
        xB = x
        x = etap_probny(xB,s,e,f)
        if f(x)<f(xB):
            while f(x)<f(xB):
                x_B = xB
                xB = x
                x = 2*xB - x_B
            x = xB
        else:
            s = alpha*s
    return xB
    




e = np.array([[1,0],[0,1]])
f = lambda x: x[0]**2 + x[1]**2
print(HJeeves(np.array([4,7]),3,e,f,0.8,0.001))
plt.plot(lst_x,lst_y)
plt.show()