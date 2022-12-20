clear;                     % clear the residue

% create the random matrix
n = 10;                    
A = rand(n);
x = rand(n, 1);
b = A * x;

% add the error
dA = 0.00001 * rand(n);
db = 0.00001 * rand(n, 1);

% calculate the x
A1 = A + dA;
b1 = b + db;
x1 = A1\b1;

% calculate the relative error
dx = x1 - x;
r = norm(dx, 1)/norm(x, 1);