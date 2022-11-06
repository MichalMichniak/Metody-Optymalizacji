def contraction_method(x0,x1,f,betha,N_max):
    i = 1 #cholera wie
    zj = x1
    zj_1 = x0
    if f(x0) == f(x1):
        return x0,x1,i
    if f(x1) < f(x0):
        x1,x0 = x0,x1
        zj = x1
        zj_1 = x0
    
    while f(x0) < f(zj):
        if i > N_max:
            return x0,zj,i
        i += 1
        zj_1 = zj
        zj = x0 + betha**(i-1)*(x1-x0)
    return min(x0, zj_1),max(x0, zj_1),i
    pass