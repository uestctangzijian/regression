function theta = funRB(phi, y)
    i = size(phi, 2);
    I = eye(i);
    H = [(-1) * (phi'),-I; phi', -I];
    b = [-y; y];
    
    p = size(phi, 1);
    D = zeros(p, 1);
    O = ones(i, 1);
    f = [D;O];
    
    x = linprog(f, H, b);
    theta = x(1:p);
end

