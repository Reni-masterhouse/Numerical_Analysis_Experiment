n = (1: 1: 52);
pp1 = spline(n, x);
pp2 = spline(n, y);
x0 = (1: 0.01: 52);
xi = ppval(pp1, x0);
yi = ppval(pp2, x0);

plot(x, y, 'or', xi, yi, '-b');