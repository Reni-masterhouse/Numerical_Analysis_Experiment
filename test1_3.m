clear;                                % clear the residue

res = zeros(1, 20);                   % create a 1x21 zero matrix
for i = 1: 20                         % caculate the result of (1 + 1/n)^n from 10^1 to 10^20
    res(i) = (1 + 1/(10^i))^(10^i);
end
x = 1: 1: 20;                         % set x from 1 to 10
plot(x, res - exp(1), '-r');          % plot the diagram