clear;                            % clear the residue

% input the data
xdata = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19];
ydata = [0.898 2.38 3.07 1.84 2.02 1.94 2.22 2.77 4.02 4.76 5.46 6.53 10.9 16.5 22.5 35.7 50.6 61.6 81.8];

fun = @(x, xdata) x(1)*exp(x(2)*xdata);  % set the function
x0 = [1 0.898];                          % choose two original parameters
x = lsqcurvefit(fun, x0, xdata, ydata);  % fitting to calculate the parameters

times = linspace(xdata(1), xdata(end));  % plot the diagram
plot(xdata, ydata, 'ko', times, fun(x,times), 'b-');
legend('Data', 'Fitted exponential');    % add the legend
title('Data and Fitted Curve');
hold on;

figure;                                  % plot the errorbar
y = fun(x, xdata);
e = abs(ydata - y);
errorbar(xdata, ydata, e);