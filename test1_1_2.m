clear;                             % clear the residue

ess = 0.000000001;                 % set the error as ess = 0.000000001
ve = zeros(1, 21);                 % create a 1x21 zero matrix
ve(2) = ess;                       % add the error to the variable of x^(19)
eqn1 = poly2sym(poly(1: 20));      % create original polyminal
eqn2 = poly2sym(poly(1: 20) + ve); % create polyminal with the error
x = 1 : 1 : 20;                    % set x from 1 to 10

a = solve(eqn1);                   % caculate the roots of original polyminal
b = solve(eqn2);                   % caculate the roots of polyminal after adding the error

plot(x, b, '-or', x, a', '-ob');   % plot the diagram
legend({'添加扰动后的多项式解','原多项式解'}) % add the legend