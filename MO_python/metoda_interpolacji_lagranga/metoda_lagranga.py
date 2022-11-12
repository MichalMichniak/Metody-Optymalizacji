import numpy as np
def lagrange_method(f : callable,a,b,epsilon,gamma,N_max):
    i = 0
    d_1 = np.inf
    d = -np.inf
    c = (a+b)/2
    while b-a >= epsilon and np.abs(d-d_1)>=gamma:
        d_1 = d
        d = (0.5)*(f(a)*(c**2 - b**2)+f(c)*(b**2-a**2)+f(b)*(a**2-c**2))/(f(a)*(c-b)+f(c)*(b-a)+f(b)*(a-c))
        if a<d<c:
            if f(d)<f(c):
                b=c
                c=d
            else:
                a = d
        else:
            if c<d<b:
                if f(d) < f(c):
                    a = c
                    c = d
                else:
                    b=d
            else:
                raise ValueError("algorytm nie jest zbieżny")
        i+=1
        if i>N_max:
            return TimeoutError("nie udało się osiągnąć epsilon")
    return d