import numpy as np


def golden_ratio_method(f,a,b,epsilon,N_max):
    alpha = (np.sqrt(5) - 1)/2
    c=b-alpha*(b-a)
    d=a+alpha*(b-a)
    i = 0
    while b-a>=epsilon:
        if i > N_max:
            return (a+b)/2
        if f(c)<f(d):
            b = d
            d = c
            c = b - alpha*(b-a)
        else:
            a = c
            c = d
            d=a + alpha*(b-a)
        i+=i
    return (a+b)/2
            