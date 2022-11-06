function [outputArg1] = metoda_zlotego_podzialu(f,a,b,epsilon,N_max)
%METODA_ZLOTEGO_PODZIALU Summary of this function goes here
%   Detailed explanation goes here
alpha = 0.6180339;%(sqrt(5)-1)/2;
c=b-alpha*(b-a);
d=a+alpha*(b-a);
i = 0;
while b-a>=epsilon
    if i > N_max
        outputArg1 = (a+b)/2;
        return
    end
    if f(c)<f(d)
        b = d;
        d = c;
        c = b - alpha*(b-a);
    else
        a = c;
        c = d;
        d=a + alpha*(b-a);
    end
    i=i+1;
end
outputArg1 = (a+b)/2;
end

