%°Circulos
r=[5 4 3 2 1];
t=0:2*pi/4:2*pi;
for i=1:length(r)
    x=r(1,i)*cos(t);
    y=r(1,i)*sin(t);
    plot(x,y)
    hold on
end

%°Me une todos los vertices 
r=[5 4 3 2 1];
t=0:2*pi/4:2*pi;
for i=1:length(r)
    x(i,:)=r(1,i)*cos(t);
    y(i,:)=r(1,i)*sin(t);
end 
plot(x,y)

%Rombo unido con varios colores 
r=[4 3 2 1];
t=0:2*pi/4:2*pi;
for i=1:length(r)
    x(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*cos(t);
    y(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*sin(t);
end 
plot(x,y)

%Para que pinte los vertices 12 76 
r=[4 3 2 1];
t=0:2*pi/4:2*pi;
for i=1:length(r)
    x(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*cos(t);
    y(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*sin(t);
end 
plot(x,y);
patch('faces',[1 2 7 6], 'vertices',[x y]')

%Para que me pinte todo el rombo 
r=[4 3 2 1];
t=0:2*pi/4:2*pi;
for i=1:length(r)
    x(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*cos(t);
    y(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*sin(t);
end 
for i=1:length(t)-1
    caras(i,:)=[i i+1 i+length(t)+1 i+length(t)];
end
plot(x,y);
hold on 
patch('faces',caras,'vertices',[x;y]')

%cambio de color 
r=[4 3 2 1];
t=0:2*pi/4:2*pi;
for i=1:length(r)
    x(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*cos(t);
    y(1,1+(i-1)*length(t):length(t)+(i-1)*length(t))=r(1,i)*sin(t);
end 
for i=1:length(t)-1
    caras(i,:)=[i i+1 i+length(t)+1 i+length(t)];
end
plot(x,y);
hold on 
patch('faces',caras,'vertices',[x;y]','facecolor',[0 1 0], 'edgecolor',[0 1 0]) %face color me cambia el color de negro hacia verde en este caso, el edgecolor me cambia el color de las lines 

%Onda del calor 
L=1
x=0:1/100:L;
t=0:20/20:10;
n=5;calor1=0
for n=1:10
    
for i=1:length(t)
    calor1=calor1+2*L*(-1)^(n-1)/(pi*n)*sin(n*pi*x/L)*exp(-0.0001*n^2*pi^2*t(1,i)/L^2);
end
    plot(x,calor1);
    %axis([-0.1 1.1 0 10]);
    pause(0.05);
end

%Ecucacion del calor con mas ondulacion y mas tiempo para observarse 
L=1
x=0:1/100:L;
t=0:20/20:10;
n=5;calor1=0
for n=1:100
    
for i=1:length(t)
    calor1=calor1+2*L*(-1)^(n-1)/(pi*n)*sin(n*pi*x/L)*exp(-0.0001*n^2*pi^2*t(1,i)/L^2);
end
    plot(x,calor1);
    %axis([-0.1 1.1 0 10]);
    pause(0.1);
end