
%Método de Adams-Bashforth de 2 pasos. Orden: 2. N = 200.
function [t,x]=mab2(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x]=meuler(f,[t(1),t(2)],x0,1);
x = x.';

% y(:,1) = f_i, y(:,2) = f_i+1
y = [f(t(1),x(:,1)),f(t(2),x(:,2))];
for i=1:N-1
    x(:,i+2) = x(:,i+1)+h/2*(3*y(:,2)-y(:,1));

    y = y(:,2);
    y(:,2) = f(t(i+2),x(:,i+2));
end

t = t(:);
x = x.';

