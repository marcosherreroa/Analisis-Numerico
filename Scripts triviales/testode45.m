datos
h = (intervalo(2)-intervalo(1))/N;
[t,x] = ode45(f,intervalo(1):h:intervalo(2),x0);
graficas