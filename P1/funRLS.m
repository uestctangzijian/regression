function theta = funRLS(phi, y)
    lamda = 0.5;
    k = size(phi, 1);
    theta = (phi * phi' + lamda * eye(k))^(-1) * phi * y;
end

