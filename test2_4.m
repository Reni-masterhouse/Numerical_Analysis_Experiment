clear;                      % clear the residue

figure('position', get(0, 'screensize'));  % to get the figure of hand
axes('position', [0 0 1 1]);
[x, y] = ginput;

% draw the figure of hand
n = (1: 1: 52);             % set the range of n
pp1 = spline(n, x);         % perform the spline interpolation for x and y
pp2 = spline(n, y);

x0 = (1: 0.01: 52);         % set the range of x0
xi = ppval(pp1, x0);         
yi = ppval(pp2, x0);

plot(x, y, 'or', xi, yi, '-b');  % plot the diagram