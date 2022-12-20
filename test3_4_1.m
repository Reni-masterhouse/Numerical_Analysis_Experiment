clear;                               % clear the residue

x = linspace(0, 1, 30);              % set the data
y = 1 + x + x.*x + x.^3 + x.^4 +x.^5;
p = polyfit(x, y, 15);               % perform the polyfit interpolation

y0 = polyval(p, x);                  % calculate the fitting function

plot(x, y, 'ro', x, y0, '-b');       % plot the diagram
xlabel('x');
ylabel('y');
legend('Data', 'Fitted Curve');