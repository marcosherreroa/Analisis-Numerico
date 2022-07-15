
color = ['r','g','b'];
n = size(x,2);

figure(1)
for i=1:n
    subplot(n,1,i)
    plot(t,x(:,i),color(i))
    s =sprintf('Coordenada %d de la solución',i);
    title(s)
end

if n == 2 || n == 3
    figure(2)
    if n == 2
        plot(x(:,1),x(:,2))
    
    else
        plot3(x(:,1),x(:,2),x(:,3))

    end

    title('Trayectoria de la solución')
end

