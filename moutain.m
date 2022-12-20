clear;                            % clear the residue

[x, y, z] = peaks(80);            % generate the data

xi = -3: 0.01: 3;                 % 2-dimension interpolation
yi = -3: 0.01: 3;
zi = interp2(x, y, z, xi', yi, 'cubic');

% mesh(xi, yi, zi);               % create a mesh plot
contour3(xi, yi, zi, 10, 'r');    % create a contour plot
% waterfall(xi, yi, zi);          % create a waterfall plot