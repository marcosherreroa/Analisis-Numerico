% Método de predicción-corrección
% Método predictor : Adams-Bashforth de 2 pasos  (orden 2)
% Método corrector : Adams-Moulton de 2 pasos (orden 3)
% Con m = 1 -> Orden 3 (N=100)
function [t,x] = mab2am2(f,intervalo,x0,N)

h = (intervalo(2)-intervalo(1))/N;
t = intervalo(1):h:intervalo(2);

[~,x] = meulermej(f,[t(1),t(2)],x0,1);
x = x.';

y = zeros(size(x0,2),2);
for i=1:2
    y(:,i) = f(t(i),x(:,i));
end

for i=1:N-2
    %Predicción
    x(:,i+2) = x(:,i+1)+h/2*(3*y(:,2)-y(:,1));

    %Evaluación + corrección
    x(:,i+2) = x(:,i+1) + h/12*(5*f(t(i+2),x(:,i+2))+8*y(:,2)-y(:,1));

    %Evaluación
    y = y(:,2);
    y(:,2) = f(t(i+2),x(:,i+2));
end

%Último nodo
x(:,N+1) = x(:,N) + h/2*(3*y(:,2)-y(:,1));
x(:,N+1) = x(:,N) + h/12*(5*f(t(N+1),x(:,N+1)) + 8*y(:,2) - y(:,1));

t = t(:);
x = x.';