clear;                            % clear the residue

n = 2;                            % set the node numbers
x2 = (1/(2*(n+1)): 1/(n+1): (2*n+1)/(2*(n+1))); % set the range of x2 
% x0 = cos(x2 .* pi);             % the interval of Chebyshev
% x0 = (-1: 2/n: 1);
x0 = (-5: 2/n: 5);                % set the range of x0
% y0 = 1./(1 + 25 .* x0 .* x0);   % y(x)
% y0 = x0 ./ (1 + x0 .* x0 .* x0 .* x0);  % h(x)
y0 = atan(x0);                    % g(x)

x = (-5: 0.01: 5);                % set the range of x
% x = (-1: 0.01: 1);
y = langrange(x0, y0, x);         % perform Lagrange interpolation

% y1 = arrayfun(@(x) 1./(1 + 25 .* x .* x), x);
% y1 = arrayfun(@(x) x./(1 + x .* x .* x .* x), x);
y1 = arrayfun(@(x) atan(x), x);   % to draw the original function

yy = spline(x0, y0, x);           % perform spline interpolation

plot(x, y,'-b', x, yy,'-g', x, y1,'-r');  % plot the diagram
legend({'拉格朗日插值函数','三次样条插值函数','原函数'})  % add the legend
