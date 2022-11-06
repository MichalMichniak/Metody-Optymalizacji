function [outputArg1,outputArg2, outputArg3] = ekspansion_method(x0,x1,f,alpha,N_max)
%EKSPANSION_METHOD Summary of this function goes here
%   Detailed explanation goes here
syms outputArg1 outputArg2 outputArg3;
i = 0;
f_ = @(x)f(x + x0);
x_1 = 0;
x_0 = 0;
if f_(x_0) == f_(x1)
    outputArg1 = x_0 + x0;
    outputArg2 = x1 + x0;
    outputArg3 = i;
    return
end
if f_(x1) > f_(x_0)
    x1 = -x1;
    if f_(x1) >= f_(x_0)
        outputArg1 = x1 + x0;
        outputArg2 = -x1 + x0;
        outputArg3 = i;
        return
    end
end
while f_(x_0) > f_(x1)
    if i > N_max
        outputArg1 = None;
        outputArg2 = None;
        outputArg3 = None;
        return
    end
    i = i + 1;
    x_1 = x_0;
    x_0 = x1;
    x1 = alpha * x1;
end
if x_1< x1
    outputArg1 = x_1  + x0;
    outputArg2 = x1 + x0;
    outputArg3 = i;
    return
end
outputArg1 = x1  + x0;
outputArg2 = x_1 + x0;
outputArg3 = i;
end

