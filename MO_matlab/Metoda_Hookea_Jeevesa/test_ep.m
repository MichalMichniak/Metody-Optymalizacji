function [x_st] = test_ep(x,s,e,f)
%TEST_EP Summary of this function goes here
%   Detailed explanation goes here
for j = 1:length(e)
    if f(x + s*e(j,:)) < f(x)
        x = x + s*e(j,:);
    else
        if f(x - s*e(j,:)) < f(x)
           x = x - s*e(j,:);
        end
    end
end
x_st = x;
end

