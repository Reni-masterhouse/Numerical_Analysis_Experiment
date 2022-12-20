clear;

n = 40;
A = rand(n);
% B = inv(A);

B = A'*A;
E = eig(B);

c1 = sqrt(max(E)/min(E));
c2 = cond(A, 2);

d = abs(c1 - c2);