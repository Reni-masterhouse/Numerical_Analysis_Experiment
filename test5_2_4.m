clear;                      % clear the residue

n = 20;                     % set the dimension n
A = rand(n);                % create the equation
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
r1 = norm(dx, 1)/norm(x, 1);

c = condest(A);
r2 = (norm(dA, 1)/norm(A, 1) + norm(db, 1)/norm(b, 1)) * c/(1 - c * norm(dA, 1)/norm(A, 1));
% r3 = (norm(dA, 1)/norm(A, 1) + norm(db, 1)/norm(b, 1)) * c/(1 - norm(inv(A), 1) * norm(dA, 1));

s = abs(r1 - r2);