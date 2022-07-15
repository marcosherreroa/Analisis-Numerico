%Método de R-K de 2 pasos y orden 2 con beta = 0 y alpha=1
% 0    0   0
% 1/2  1/2 0
%      0   1
%Basta con N = 200
function [t,x]=meulermod(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

x(:,1)=x0;
for i=1:N
    %Aunque en este caso concreto no haga falta, mejor separar los coefs
    F1 = f(t(i),x(:,i));
    F2 = f(t(i)+1/2*h,x(:,i)+h/2*F1);
    x(:,i+1) = x(:,i) + h*F2;
end

t = t(:);
x = x.';
