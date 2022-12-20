clear;                      % clear the residue

n = 5;

A = zeros(n, n);
for i = 1 : 1 : n
    for j = 1 : 1 : n
        A(i, j) = (1 + 0.1 * (i - 1))^(j - 1);
    end
end

% output the cond
c1 = cond(A, 1);
c2 = cond(A, 2);
c3 = cond(A, Inf);
disp(['1 cond = ', num2str(c1), ' 2 cond = ', num2str(c2), ' Infinity cond = ', num2str(c3)]);

% calculate the x
b = sum(A, 2);
x = A\b;

% add the error
dA = 0.0001;
A(n, n) = A(n, n) + dA;

x1 = A\b;
% error = norm(x - x1, Inf);

dx = (x1 - x)./x;