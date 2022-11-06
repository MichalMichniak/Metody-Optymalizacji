function [outputArg1,outputArg2, outputArg3] = contraction_method(x0,x1,f,betha,N_max)
%contraction_METHOD Summary of this function goes here
%   Detailed explanation goes here
syms outputArg1 outputArg2 outputArg3;
i = 1;
zj = x1;
zj_1 = x0;
if f(x0) == f(x1)
    outputArg1 = x0;
    outputArg2 = x1;
    outputArg3 = i;
    return
end
if f(x1) < f(x0)
    x_temp = x0;
    x0= x1;
    x1 = x_temp;
    zj = x1;
    zj_1 = x0;
end
while f(x0) < f(zj)
    if i > N_max
        if x0>zj
            outputArg1 = zj;
            outputArg2 = x0;
            outputArg3 = i;
            return 
        else
            outputArg1 = x0;
            outputArg2 = zj;
            outputArg3 = i;
            return
        end
    end
    i = i + 1;
    zj_1 = zj;
    zj = x0 + betha^(i-1)*(x1-x0);
end
if zj_1< x0
    outputArg1 = zj_1;
    outputArg2 = x0;
    outputArg3 = i;
    return
end
outputArg1 = x0;
outputArg2 = zj_1;
outputArg3 = i;
end

