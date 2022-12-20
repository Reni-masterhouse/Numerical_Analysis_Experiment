function y = langrange(x0, y0, x)  % name the function

% x : value be used to predict
% y : value to estimate

    n = length(x);         % numbers to predict
    y = zeros(1, n);       % initialize to 0
    
    for k = 1: length(x0)
        j_nk = find((1: length(x0)) ~= k);
        % find to return the element without subscript k
        % k is from 1 to length(x0)
        
        y1 = 1;
        for j = 1: length(j_nk)
            y1 = y1 .* (x - x0(j_nk(j))); 
            % multiply (x-xj) continuously from 1 to length(j_nk)
        end
        
        y = y + y1 * y0(k) / prod(x0(k) - x0(j_nk));
        % prod return to the product of array elements
    end
end
    
