load('poly_data.mat')

for i=1:10
    sx = sampx(i:10:50);
    sy = sampy(i:10:50);
    
    k = length(sx);
    p = 6;
    x0 = ones(p,k);
    
    for j = 1:p-1
        x0(j + 1,:) = sx .^ j;
    end

    theta_LS = funLS(x0, sy);
    theta_RLS = funRLS(x0, sy);
    theta_LASSO = funLASSO(x0, sy);
    theta_RR = funRR(x0, sy);
    [var_BR, mean_BR] = funBR(x0, sy);

    for k = 1:p-1
        xn(k + 1,:) = polyx .^ k;
    end

    y0_LS = xn' * theta_LS;
    y0_RLS = xn' * theta_RLS;
    y0_LASSO = xn' * theta_LASSO;
    y0_RR = xn' * theta_RR;
    y0_BR = xn' * mean_BR;
    var_fin = xn' * var_BR * xn;

    ms_LS = mean((y0_LS - polyy) .^ 2);
    ms_RLS = mean((y0_RLS - polyy) .^ 2);
    ms_LASSO = mean((y0_LASSO - polyy) .^ 2);
    ms_RR = mean((y0_RR - polyy) .^ 2);
    ms_BR = mean((y0_BR - polyy) .^ 2);

    figure;
        subplot(3,2,1)
        disp(theta_LS);
        scatter(sx,sy,25,'.','k');
        hold on 
        plot(polyx,polyy,'r');
        hold on
        plot(polyx,y0_LS,'g');
        xlabel('x');
        ylabel('y');
        title('10% LS 5order');

        subplot(3,2,2)
        disp(theta_RLS);
        scatter(sx,sy,25,'.','k');
        hold on 
        plot(polyx,polyy,'r');
        hold on
        plot(polyx,y0_RLS,'g');
        xlabel('x');
        ylabel('y');
        title('10% RLS 5order');

        subplot(3,2,3)
        disp(theta_LASSO);
        scatter(sx,sy,25,'.','k');
        hold on 
        plot(polyx,polyy,'r');
        hold on
        plot(polyx,y0_LASSO,'g');
        xlabel('x');
        ylabel('y');
        title('10% LASSO 5order');

        subplot(3,2,4)
        disp(theta_RR);
        scatter(sx,sy,25,'.','k');
        hold on 
        plot(polyx,polyy,'r');
        hold on
        plot(polyx,y0_RR,'g');
        xlabel('x');
        ylabel('y');
        title('10% RR 5order');

        subplot(3,2,5)
        scatter(sx,sy,25,'.','k');
        hold on 
        plot(polyx,polyy,'r');
        hold on
        plot(polyx,y0_BR,'g');
        xlabel('x');
        ylabel('y');
        title('10% BR 5order');
end    
    