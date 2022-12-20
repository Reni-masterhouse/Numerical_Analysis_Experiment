x = (0: 1: 10);                % set the range of x
y = [0.0 0.79 1.53 2.19	2.71 3.03 3.27 2.89	3.06 3.19 3.29];
% set the variables

cs = spline(x,[0.8 y 0.2]);    % perform the spline interpolation
xx = linspace(0, 10, 101);     % set the range of xx

plot(x, y, 'o',xx, ppval(cs, xx), '-');  % plot the diagram
