%Método de R-K de orden 4
% Basta con N = 50

function [t,x]=mrk4(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

x(:,1)=x0;
for i=1:N
    F1 = f(t(i),x(:,i));
    F2 = f(t(i)+h/2,x(:,i)+h/2*F1);
    F3 = f(t(i)+h/2,x(:,i)+h/2*F2);
    F4 =f(t(i)+h,x(:,i)+h*F3);

    x(:,i+1)= x(:,i)+h/6*(F1+2*F2+2*F3+F4);
end

t = t(:);
x = x.';