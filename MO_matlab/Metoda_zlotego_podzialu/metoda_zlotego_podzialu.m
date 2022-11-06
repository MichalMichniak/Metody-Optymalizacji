function [rozw_przyblizone ,i] = metoda_zlotego_podzialu(f, x0, x1, eps, N_max)
i = 1;
alpha = (sqrt(5) - 1)/2;
a(1) = x0;
b(1) = x1;
c(1) = b(1) - alpha*(b(1) - a(1));
d(1) = a(1) + alpha*(b(1) - a(1));
while 1
    if f(c(i)) < f(d(i))
        a(i+1) = a(i);
        b(i+1) = d(i);
        d(i+1) = c(i);
        c(i+1) = b(i+1) - alpha*(b(i+1) - a(i+1));
    else
        a(i+1) = c(i);
        b(i+1) = b(i);
        d(i+1) = a(i+1) + alpha*(b(i+1) - a(i+1));
        c(i+1) = d(i);
    end
    i = i + 1;
    if i > N_max
        fprintf('ERROR')
        return
    end
    if b(i) - a(i) < eps
        break
    end
end
rozw_przyblizone = (a(i) + b(i))/2;
return
end

