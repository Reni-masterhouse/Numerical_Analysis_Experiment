clear;                             % clear the residue

n = 20;                            % set the node numbers
x0 = (-5: 2/n: 5);                 % set the range of x0
% y0 = 1./(1 + 25 .* x0 .* x0);    % y(x)
% y0 = x0 ./ (1 + x0 .* x0 .* x0 .* x0);  % h(x)
y0 = atan(x0);                     % g(x)

x = (-5: 0.01: 5);                 % set the range of x
y = langrange(x0, y0, x);          % perform Lagrange interpolation

% y1 = arrayfun(@(x) 1./(1 + 25 .* x .* x), x);
y1 = arrayfun(@(x) atan(x), x);    % to draw the original function

plot(x, y,'-b', x, y1,'-r');       % plot the diagram