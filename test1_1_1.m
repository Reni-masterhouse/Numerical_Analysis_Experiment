clear;                           % clear the residue

ess = 0.000000001;               % set the error as ess = 0.000000001
ve = zeros(1, 21);               % create a 1x21 zero matrix
ve(2) = ess;                     % add the error to the variable of x^(19)
a = roots(poly(1: 20) + ve);     % caculate the roots of polyminal after adding the error
b = roots(poly(1: 20));          % caculate the roots of original polyminal
x = 1 : 1 : 20;                  % set x from 1 to 10
plot(x, b, '-or', x, a', '-ob'); % plot the diagram
legend({'原多项式解','添加扰动后的多项式解'}) % add the legend