function x = gausselimination(A, n, b, sw)
    % combine the A and b as B
    l = diag(ones(1, n));        % create the elimination factor
    x = zeros(1, n);
    B = [A, b];
    
    % choose sw as 1 to use the sequential elimination
    if sw == 1
        disp('use the sequential elimination');
        for i = 1 : n-1
            if B(i, i) == 0
                disp("The pivot is 0, Gauss elimination cannot continue.");
                break
            end

            for j = i+1 : n
                l(j, i) = B(j, i) / B(i, i);
                B(j, :) = B(j, :) - B(i, :) * l(j, i);
%                 b(j) = b(j) - b(i) * l(j, i);
            end
        end

        x(n) = B(n, n+1) / B(n , n);
        x(n-1) = (B(n-1, n+1) - B(n-1 , n) .* x(n)) / B(n-1 , n-1);

        for p = n-2 : -1 : 1
            x(p) = (B(p, n+1) - B(p , p+1 : n) * x(p+1 : n)') / B(p, p);
        end
%         disp(["the answer of sequential elimination is: ", num2str(x)]);
        
    % choose sw as 2 to use the minimum modulus elimination
    elseif sw == 2
        disp('use the minimum modulus elimination');
        for i = 1 : n-1
            E = abs(B(i : n, i)); % the element of the list i
            [~, k] = min(E(E > 0));
            a = B(k+i-1, i);
            B([i k+i-1], :) = B([k+i-1 i], :);
            
            if B(i, i) == 0
                disp("The pivot is 0, Gauss elimination cannot continue.");
                break
            end

            for j = i+1 : n
                l(j, i) = B(j, i) / a;
                B(j, :) = B(j, :) - B(i, :) * l(j, i);
            end
        end

        x(n) = B(n, n+1) / B(n , n);
        x(n-1) = (B(n-1, n+1) - B(n-1 , n) .* x(n)) / B(n-1 , n-1);

        for p = n-2 : -1 : 1
            x(p) = (B(p, n+1) - B(p , p+1 : n) * x(p+1 : n)') / B(p, p);
        end
    
    % choose sw as 3 to use the maximum modulus elimination
    elseif sw == 3
        disp('use the maximum modulus elimination');
        for i = 1 : n-1
            E = abs(B(i : n, i)); % the element of the list i
            [~, k] = max(E(E > 0));
            a = B(k+i-1, i);
            B([i k+i-1], :) = B([k+i-1 i], :);
            
            if B(i, i) == 0
                disp("The pivot is 0, Gauss elimination cannot continue.");
                break
            end

            for j = i+1 : n
                l(j, i) = B(j, i) / a;
                B(j, :) = B(j, :) - B(i, :) * l(j, i);
            end
        end

        x(n) = B(n, n+1) / B(n , n);
        x(n-1) = (B(n-1, n+1) - B(n-1 , n) .* x(n)) / B(n-1 , n-1);

        for p = n-2 : -1 : 1
            x(p) = (B(p, n+1) - B(p , p+1 : n) * x(p+1 : n)') / B(p, p);
        end
    end
end

