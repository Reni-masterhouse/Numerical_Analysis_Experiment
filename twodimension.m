clear;                            % clear the residue

x = 100: 100: 400;                % set the data
y = 100: 100: 400;
temps = [636 697 624 478; 698 712 630 478; 680 674 598 412; 662 626 552 334];

xi = 100: 10: 400;                % 2-dimension interpolation
yi = 100: 10: 400;
zi = interp2(x, y, temps, xi', yi, 'cubic');

mesh(xi, yi, zi);                 % create a mesh plot
max(max(zi));                     % calculate the highest point