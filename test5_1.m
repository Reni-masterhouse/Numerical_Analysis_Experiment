clear;                     % clear the residue

n = 100;                   % set the dimension n

% create the matrix A
% A = rand(n);
A = diag(ones(1, n)*6) + diag(ones(1, n-1), 1) + diag(ones(1, n-1)*8, -1);
b = [7 ones(1, n-2)*15 14]';
X = A\b;                   % calculate the X

% output the cond
c1 = cond(A, 1);
c2 = cond(A, 2);
c3 = cond(A, Inf);
disp(['1 cond = ', num2str(c1), ' 2 cond = ', num2str(c2), ' Infinity cond = ', num2str(c3)]);

% 1:sequential elimination 2:minimum modulus elimination 3:maximum modulus elimination
y1 = gausselimination(A, n, b, 1);
error1 = norm(y1 - X, Inf);
disp(['the sequential elimination error is: ', num2str(error1)]);
 
y2 = gausselimination(A, n, b, 2);
error2 = norm(y2 - X, Inf);
disp(['the minimum elimination error is: ', num2str(error2)]);

y3 = gausselimination(A, n, b, 3);
error3 = norm(y3 - X, Inf);
disp(['the maximum elimination error is: ', num2str(error3)]);

