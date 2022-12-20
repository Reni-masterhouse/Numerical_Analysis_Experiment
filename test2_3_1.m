clear;                      % clear the residue

S = myspline([0.0 0.79 1.53 2.19 2.71 3.03 3.27 2.89 3.06 3.19 3.29], 0.8, 0.2);
% set the variables

xs = zeros(1, 0);           % initialize to save the coordinate       
ys = zeros(1, 0);

for i = 1: 1: 10            % draw the function S
    x = i-1: 0.01: i;
    y = subs(S(i), x);
    xs = [xs x];
    ys = [ys y];
end

plot(xs, ys, '-b');         % plot the diagram