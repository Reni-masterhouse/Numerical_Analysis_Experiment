clear;                % clear the residue

r = 0;                % set the sum resulf as r = 0
for i = 1: 1000       % caculate the sum of 1000 0.1
    r = 0.1 + r;
end
s = r - 100;          % minus the sum result with 100