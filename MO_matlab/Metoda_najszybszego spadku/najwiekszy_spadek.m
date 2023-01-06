function [x_lst] = najwiekszy_spadek(f,x_,N_max,epsilon)
%NAJWIEKSZY_SPADEK - metoda największego spadku
% dane wejściowe:
% f - funkcja celu dla sympolicznych wartości wektora syms
% x_ - punkt początkowy
% N_max - maksymalna liczba iteracji
% epsilon - warunek stopu
i = 1;
f_diff = gradient(f);
f_diff_func = matlabFunction(f_diff);
f_func = matlabFunction(f);
f_diff_func_vect = @(x)f_diff_func(x(1),x(2));
f_func_vect = @(x)f_func(x(1),x(2));
x = [];
x(:,end+1) = x_;
while i<N_max
    d = f_diff_func_vect(x(:,i));
    f_func_direction = @(step)(f_func_vect(x(:,end)-step*d));
    h = fminsearch(f_func_direction,0);
    i=i+1;
    x(:,end+1) = x(:,end) - h*d;
    if sqrt(sum((x(:,end)-x(:,end-1)).^2)) < epsilon
        x_lst = x;
        return
    end
end
x_lst = "error";
end

