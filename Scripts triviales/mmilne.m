%Método de Milne de 4 pasos y orden 4

function [t,x]=mmilne(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = mrk3(f,[t(1),t(4)],x0,3);
x = x.';

%y(:,1) = f(t(i+1),x(:,i+1))
y = zeros(size(x0,2),3);
for i=1:3
    y(:,i) = f(t(i+1),x(:,i+1));
end

for i=1:N-3
    x(:,i+4) = x(:,i) + 4*h/3*(2*y(:,3)-y(:,2)+2*y(:,1));

    y = y(:,2:3);
    y(:,3) = f(t(i+4),x(:,i+4));
end

t = t(:);
x = x.';