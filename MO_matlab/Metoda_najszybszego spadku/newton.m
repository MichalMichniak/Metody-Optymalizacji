function [x_lst] = newton(f,x_,N_max,epsilon)
%newton - metoda newtona dla problemu optymalizacji
% dane wejściowe:
% f - funkcja celu dla sympolicznych wartości wektora syms
% x_ - punkt początkowy
% N_max - maksymalna liczba iteracji
% epsilon - warunek stopu

i = 1;
% liczenie gradientu:
f_diff = gradient(f);
% zamiana gradientu funkcji symbolicnej na funkcje zwykłą
f_diff_func = matlabFunction(f_diff);
% zamiana funkcji symbolicnej na funkcje zwykłą
f_func = matlabFunction(f);
% rozpakowanie argumentów funkcji:
f_diff_func_vect = @(x)f_diff_func(x(1),x(2));
f_func_vect = @(x)f_func(x(1),x(2));
% symboliczne policzenie macierzy Hessego
H = hessian(f);
% zamiana macierzy Hessego z formy symbolicnej na funkcje zwykłą
H_func = matlabFunction(H);
H_func_vect = @(x)H_func(x(1),x(2));
%inicjalizacja wartości początkowej:
x = [];
x(:,end+1) = x_;
%warunek stopu na liczbę iteracji
while i<N_max
    % warunek stopu na wyznacznik macierzy Hessego
    if det(H_func_vect(x(:,i))) == 0
        x_lst = x;
        return
    end
    % warunek stopu na gradient funkcji celu
    if f_diff_func_vect(x(:,i)) == [0;0]
        x_lst = x;
        return
    end
    % policzenie kierunku do optymalizacji na kierunku
    d = inv(H_func_vect(x(:,i)))*f_diff_func_vect(x(:,i));
    % funkcja do optymalizacji jednowymiarowej 
    f_func_direction = @(step)(f_func_vect(x(:,end)-step*d));
    % optymalizacja na kierunku (dobranie suboptymalnego kroku)
    h = fminsearch(f_func_direction,0);
    i=i+1;
    x(:,end+1) = x(:,end) - h*d;
    % warunek stopu na przyrost argumentów
    if sqrt(sum((x(:,end)-x(:,end-1)).^2)) < epsilon
        x_lst = x;
        return
    end
end
x_lst = "error";
end

