function theta = funLS(phi, y)
    theta = (phi * phi')^(-1) * phi * y
end

