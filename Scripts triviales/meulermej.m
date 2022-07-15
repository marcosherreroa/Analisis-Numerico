%Método de R-K de 2 pasos y orden 2 con beta=0 y alpha=1/2
% 0  0  0
% 1  1  0
%   1/2 1/2
%Basta con N=200

function [t,x]=meulermej(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

x(:,1)=x0;
for i=1:N
    F1 = f(t(i),x(:,i));
    F2 = f(t(i)+ h,x(:,i)+ h*F1);
    x(:,i+1) = x(:,i)+h*(1/2*F1+1/2*F2);
end

t = t(:);
x = x.';