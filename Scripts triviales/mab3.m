
%Método de Adams-Bashforth de 3 pasos. Orden 3. N  = 100
function [t,x]=mab3(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = meulermej(f,[t(1),t(3)],x0,2);
x = x.';

y = zeros(size(x0,2),3);
%y(:,j) = f_(i+j-1)
for i=1:3
    y(:,i) = f(t(i),x(:,i));
end

for i=1:N-2
    x(:,i+3) = x(:,i+2) + h/12*(23*y(:,3)-16*y(:,2)+5*y(:,1));

    y = y(:,2:3);
    y(:,3) = f(t(i+3),x(:,i+3));
end

t = t(:);
x = x.';