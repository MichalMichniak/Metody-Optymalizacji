function [outputArg1] = lagrangian_method(f,a,b,epsilon,gamma,N_max)
%LAGRANGIAN_METHOD Summary of this function goes here
%   Detailed explanation goes here
i = 0;
d_1 = inf;
d = -inf;
c = (a+b)/2;
while (b-a) >= epsilon && abs(d-d_1)>=gamma
        d_1 = d;
        d = (0.5)*(f(a)*(c^2 - b^2)+f(c)*(b^2-a^2)+f(b)*(a^2-c^2))/(f(a)*(c-b)+f(c)*(b-a)+f(b)*(a-c));
        if a<d && d<c
            if f(d)<f(c)
                b=c;
                c=d;
            else
                a = d;
            end
        else
            if c<d && d<b
                if f(d) < f(c)
                    a = c;
                    c = d;
                else
                    b=d;
                end
            else
                outputArg1 = "rozbierzny";
                return
            end
        end
        i=i+1;
        if i>N_max
            outputArg1 = d;
            return
        end
end
outputArg1 = d;
end

