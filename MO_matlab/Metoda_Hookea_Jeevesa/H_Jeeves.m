function [x_star] = H_Jeeves(x,s,e,f,alpha,epsilon,max_iter)
%H_JEEVES Summary of this function goes here
%   Detailed explanation goes here
while s>epsilon
    xB = x;
    x = test_ep(x,s,e,f);
    if f(x) < f(xB)
        n_iteration = 0;
        while f(x) < f(xB)
            x_B = xB;
            xB = x;
            x = 2*xB - x_B;
            n_iteration = n_iteration + 1;
            if n_iteration > max_iter
                x_star = inf;
                return
            end
        end
        x = xB;
    else
        s = alpha*s;
    end
    
end
x_star = xB;
end

