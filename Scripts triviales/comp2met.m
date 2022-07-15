
function comp2met(met1,met2)

datos
[t,x1] = met1(f,intervalo,x0,N);
[~,x2] = met2(f,intervalo,x0,N);

n = size(x0,2);

figure(1)
for i=1:n
    subplot(n,1,i)
    plot(t,x1(:,i),'r',t,x2(:,i),'g');
    s = sprintf('Coordenadas %d de las soluciones',i);
    title(s)
end

pause(1)
figure(2)

dif = x1 - x2;
for i = 1:n
    subplot(n,1,i)
    plot(t,dif(:,i),'b');
    s=sprintf('Diferencia entre las coordenadas %d de las soluciones',i);
    title(s)
end

pause(1)
if n==2 || n==3
    figure(3)
    if n==2
        plot(x1(:,1),x1(:,2),'r',x2(:,1),x2(:,2),'g')
    end
    if n == 3
        plot(x1(:,1),x1(:,2),x1(:,3),'r',x2(:,1),x2(:,2),x2(:,3),'g')
    end

    title('Trayectoria de la solución')
end

disp(max(max(abs(dif))))