%Método de R-k de orden 3
%Basta con N=100

function [t,x]=mrk3(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

x(:,1)=x0;
for i=1:N
    F1 = f(t(i),x(:,i));
    F2 = f(t(i)+h/2,x(:,i)+h/2*F1);
    F3 = f(t(i)+3*h/4,x(:,i)+3*h/4*F2);

    x(:,i+1)=x(:,i)+h/9*(2*F1+3*F2+4*F3);
end

t = t(:);
x=x.';
   
