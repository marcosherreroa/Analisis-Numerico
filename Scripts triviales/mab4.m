%Método de Adams-Bashforth de 4 pasos. Orden 4. N= 50

function [t,x]=mab4(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = mrk3(f,[t(1),t(4)],x0,3);
x = x.';

y = zeros(size(x0,2),4);
for i = 1:4
    y(:,i) = f(t(i),x(:,i));
end
%y(:,j) = f_(i+j-1) = f(t(i+j),x(:,i+j))
for i=1:N-3
    x(:,i+4) = x(:,i+3) +h/24*(55*y(:,4)-59*y(:,3)+37*y(:,2)-9*y(:,1));

    y = y(:,2:4);
    y(:,4) = f(t(i+4),x(:,i+4));
end

t = t(:);
x = x.';