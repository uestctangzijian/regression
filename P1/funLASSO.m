function theta = funLASSO(phi,y)
    lamda = 0.5;
    H = [(phi * phi'),(-(phi * phi'));(-(phi * phi')),(phi * phi')];
    f0 = [(phi * y);(-(phi * y))];
    f = (lamda * ones(size(phi,1) * 2, 1)) - f0;
    x = quadprog(H, f, -eye(size(phi, 1) * 2), zeros(size(phi,1) * 2, 1));
    
    theta = x(1:length(x)/2)-x(length(x)/2 + 1:end);
end

