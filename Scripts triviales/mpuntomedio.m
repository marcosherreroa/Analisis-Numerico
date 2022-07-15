%Método de orden 2. Necesario N = 200
function [t,x] = mpuntomedio(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = meuler(f,[t(1),t(2)],x0,1);
x = x.';

for i=1:N-1
    x(:,i+2) = x(:,i) + 2*h*f(t(i+1),x(:,i+1));
end

t = t(:);
x = x.';