clear;                      % clear the residue

% create the random matrix
n1 = 10;
A1 = rand(n1);
n2 = 20;
A2 = rand(n2);
n3 = 30;
A3 = rand(n3);

% write down the time of calculation
disp('n = 10 时运行时间: ');
tic
    c1 = condest(A1);
toc

disp('n = 20 时运行时间: ');
tic
    c2 = condest(A2);
toc

disp('n = 30 时运行时间: ');
tic
    c3 = condest(A3);
toc
