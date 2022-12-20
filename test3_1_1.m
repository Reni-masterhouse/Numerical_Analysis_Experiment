clear;                             % clear the residue

% x = -1: 0.01: 1;                 % set the range of independent variable
x = -5: 0.01: 5;                   % another variable range

% y = 1./(1+25.*x.*x);             % save the first function as 3_1_1x
% y = x ./ (1 + x .* x .* x .* x); % save the second function as 3_1_2x
y = atan(x);                       % save the third function as 3_1_3x

xx = -5: 0.01: 5;                  % actually I make the xx = x to simplify the compare
% xx = -1: 0.01: 1; 

p2 = polyfit(x, y, 2);             % draw the curve of polygon in degree n (2\3)
yy = polyval(p2, xx);

p3 = polyfit(x, y, 3);
yy2 = polyval(p3, xx);

xlabel('x');                       % plot the diagram
ylabel('y');
plot(x, y, '-r', xx, yy, '-b', xx, yy2, '-g');
legend({'原函数', '二次拟合多项式','三次拟合多项式'});  % add the legend

