%Examen ordinaria 2020

clear
f = @(t,x) 2*x*(5-x);
intervalo = [0,2];
x0 = 3;
N = 20;

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

x(:,1) = x0;
x(:,2) = x(:,1) + h*f(t(1),x(:,1));

for i=1:N-1
    x(:,i+2) = x(:,i+1) + h*f(t(i+1),x(:,i+1));
    x(:,i+2) = 4/3*x(:,i+1) -1/3*x(:,i)+2*h/3*f(t(i+2),x(:,i+2));
end

disp(t)
disp(x)

t = t(:);
x = x.';

disp(t)
disp(x)

solexac = @(t) 15./(3+2*exp(-10*t));
xexac = solexac(t);

plot(t,x,'r');
hold on
plot(t,xexac,'g')
legend('Solución numérica','Solución exacta')

error = max(max(abs(xexac-x)));
s = sprintf('El error es %d.',error);
disp(s);

