% Método de orden 1. Necesario N=50000
function [t,x]=meuler(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

%x = zeros(length(x0),N);
x(:,1) = x0;
for i=1:N
    x(:,i+1) = x(:,i) + h*f(t(i),x(:,i));
end

t=t(:);
x = x.';