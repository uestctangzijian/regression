load('poly_data.mat')
k = length(sampx);
p = 10;
x0 = ones(p,k);

for i = 1:p-1
    x0(i + 1,:) = sampx .^ i;
end

theta_LS = funLS(x0, sampy);
theta_RLS = funRLS(x0, sampy);
theta_LASSO = funLASSO(x0, sampy);
theta_RR = funRR(x0, sampy);
[var_BR, mean_BR] = funBR(x0, sampy);

for i = 1:p-1
    xn(i + 1,:) = polyx .^ i;
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

figure(1);
    disp(ms_LS);
    scatter(sampx,sampy,25,'.','k');
    hold on 
    plot(polyx,polyy,'r');
    hold on
    plot(polyx,y0_LS,'g');
    xlabel('x');
    ylabel('y');
    title('LS 10order');
    legend('samples','true function','estimated function')

figure(2);
    disp(ms_RLS);
    scatter(sampx,sampy,25,'.','k');
    hold on 
    plot(polyx,polyy,'r');
    hold on
    plot(polyx,y0_RLS,'g');
    xlabel('x');
    ylabel('y');
    title('RLS 10order');
    legend('samples','true function','estimated function')

figure(3);
    disp(ms_LASSO);
    scatter(sampx,sampy,25,'.','k');
    hold on 
    plot(polyx,polyy,'r');
    hold on
    plot(polyx,y0_LASSO,'g');
    xlabel('x');
    ylabel('y');
    title('LASSO 10order');
    legend('samples','true function','estimated function')

figure(4);
    disp(ms_RR);
    scatter(sampx,sampy,25,'.','k');
    hold on 
    plot(polyx,polyy,'r');
    hold on
    plot(polyx,y0_RR,'g');
    xlabel('x');
    ylabel('y');
    title('RR 10order');
    legend('samples','true function','estimated function')

figure(5);
    disp(ms_BR);
    scatter(sampx,sampy,25,'.','k');
    hold on 
    plot(polyx,polyy,'r');
    hold on
    plot(polyx,y0_BR,'g');
    xlabel('x');
    ylabel('y');
    title('BR 10order');
    legend('samples','true function','estimated function')