clear;                             % clear the residue

% input the data
xdata = [1 2 3 4 5 6 7 8 9 10];
ydata = [2615 1943 1494 1087 765 538 484 290 226 204];

% fun = @(x, xdata) x(1).*exp(x(2).*xdata);  % exponential fitting
% x0 = [1 1];
% x = lsqcurvefit(fun, x0, xdata, ydata);  

times = linspace(xdata(1), xdata(end));
p = polyfit(xdata, ydata, 5); 
yy = polyval(p, times);

% plot(xdata, ydata, 'ko', times, yy, 'b-');  % plot the diagram
% legend('Data', 'Fitted exponential');  % add the legend
% title('Data and Fitted Curve');
% hold on;

% y = fun(x, xdata);       % function x(1)*exp(x(2)*xdata)

% figure;
% % plot(xdata, ydata, 'ko', times, y, 'b-');
% e = abs(ydata - y);
% errorbar(ydata, y);

% figure;                                  % plot the errorbar
% y = polyval(p, xdata);
% e = abs(ydata - y);
% errorbar(xdata, ydata, e);

y = polyval(p, 4.5);       % calculate the average value after 4.5 years
