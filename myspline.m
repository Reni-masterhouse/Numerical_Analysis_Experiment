function [si] = myspline(y, y_0, y_10)   % name the function

    syms x;                              % set the parameter

    f = y(2: 11) - y(1: 10);             % f(i) = h_i 
    
    d(1) = 6 * (f(1) - y_0);             % calculate the vector [d]
    d(11) = 6 * (y_10 - f(10));
    d(2: 10) = 3 * (f(2: 10) - f(1: 9));
    
    b = ones(1, 11) * 2;                 % set the diagonal [b] all to 2
    a = ones(1: 10);                     % set the diagonal [a] and [c]
    a(1: 9) = 1/2;
    c = ones(1, 10);
    c(2: 10) = 1/2;

    B(1) = c(1) / b(1);                  % use formula to calculate the [beta]
    
    for i = 2: 10
        B(i) = c(i) / (b(i) - a(i-1) * B(i-1));  
        % attention: [a]'s range is [1, 10], but in formula is [2, 11]
    end
    
    Y(1) = d(1) / b(1);                  % [Y] is the [y] in formula
    
    for i = 2: 11
        Y(i) = (d(i) - a(i-1) * Y(i-1)) / (b(i) - a(i-1) * B(i-1));
    end
    
    m(11) = Y(11);                       % [m] is the [M] in formula
    
    for i = 10: -1: 1
        m(i) = Y(i) - B(i) * m(i+1);
    end
    
    for i = 1: 10                        % use [m] to calculate variables
        % [ai][bi][ci][di] is the si(x)-parameter, differs from[a][b][c][d]
        % attention: [y] here is the value of y, not [y] in line 24
        
        di(i) = y(i);                    
        ai(i) = (m(i+1) - m(i)) / 6;
        bi(i) = m(i) / 2;
        ci(i) = y(i+1) - y(i) - (m(i+1) + 2 * m(i))/6;
        % attention: the same as [di]
        
        si(i) = ai(i) .* (x-i+1).^3 + bi(i) .* (x-i+1).^2 + ci(i) .* (x-i+1) + di(i);
        % set the si(x)
    end
end

