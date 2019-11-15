function [var,mean] = funBR(phi, y)
    p = size(phi, 1);
    alpha = 1;
    var0 = 1; 
    var = ((alpha)^(-1) * eye(p) + (var0)^(-1) * phi * phi')^(-1);
    mean = (var0)^(-1) * var * phi * y; 
end

