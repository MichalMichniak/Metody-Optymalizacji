function [x_star] = powell(func,x,d,N_max,epsilon)
%POWELL metoda powela
%   x - punk początkowy
%   d - baza przestrzeni
%   N_max - maksymalna liczba iteracji kryterium stopu
%   epsilon - warunek stopu na zmianę wartości funkcji kryterialnej
i = 0;
len_d = length(d);
while i < N_max
    p0 = x; 
    pn = p0;
    for j = 1:len_d
        f = @(a)(func(pn+a*d(j,:)));
        alpha = fminsearch(f,0);
        pn = pn+alpha*d(j,:);
    end
    if abs(func(pn)-func(x))<epsilon
        x_star = pn;
        return
    end
    d(1:end-1,:) = d(2:end,:);
    d(len_d,:) = pn - p0;
    f = @(a)(func(pn+a*d(len_d)));
    alpha = fminsearch(f,0);
    pn = pn+alpha*d(end);
    x=pn;
    i= i+1;
end
x_star="error";
end

