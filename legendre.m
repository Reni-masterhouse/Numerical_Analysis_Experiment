function s = legendre(n)      % name the function

syms x;                       % define symbol x

s = sym(zeros(n+1, 1));       % define symbol array s, p, a, e
p = sym(zeros(n+1, 1));
a = sym(zeros(n+1, 1));
e = sym(zeros(n+1, 1));

f = exp(x);                   % set the function f

p(1) = 1;                     % set order 1 Legendre function
p(2) = x;                     % set order 1 Legendre function

for i = 3 : n+1               % calculate order 3-n Legendre function
    p(i) = ((2 * i - 3) * x * p(i-1) - (i-2) * p(i-2))/(i-1);
end

for j = 1 : n+1               % calculate orthogonal polynomial coefficients
    a(j) = (2 * j - 1)/2 * (int(f * p(j), -1, 1));
end

s(1) = a(1) * p(1);
e(1) = abs(f - s(1));

for j = 1 : n              % find the Best-Square-Approximation Polynomial
    s(j+1) = s(j) + a(j+1) * p(j+1);
    e(j+1) = abs(f - s(j+1));
end

E = zeros(n+1, 1);

for i = 1 : n+1            % plot the diagram from n=0 to n=10
    subplot(3,4,i);
    x1 = -1 : 0.01 : 1;
    e1 = subs(e(i), x1);
    plot(x1, e1, 'r-');
    title(['次数为n=', int2str(i-1)]);
    legend('误差分布');
    grid on;
    E(i) = max(double(e1));  
end

% plot the-least-square curve between En-n
N = 1 : n+1;
a0=[1 -1 1 1];
fun = @(a, xdata) a(1) .* exp(a(2) .* xdata) + a(3) .* xdata + a(4);

a = lsqcurvefit(fun, a0, N, E');

subplot(3,4,12);
y = a(1) .* exp(a(2) .* N) + a(3) .* N + a(4);

plot(N, E, 'o', N, y, '-b');
title('最大误差随次数的分布');
xlabel('n');
ylabel('E');
legend('最大误差');
grid on;
