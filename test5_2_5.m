clear;                    % clear the residue

n = 7;                    % create the Hilbert matrix
H = hilb(n);

% H = zeros(n, n);
% for i = 1 : 1 : n
%     for j = 1 : 1 : n
%         H(i, j) = 1/(i + j - 1);
%     end
% end

% output the cond
c1 = cond(H, 1);
c2 = cond(H, 2);
c3 = cond(H, Inf);
disp(['1 cond = ', num2str(c1), ' 2 cond = ', num2str(c2), ' Infinity cond = ', num2str(c3)]);

% estimate the condest
c = condest(H);
disp(['1 cond evaluate = ', num2str(c)]);
