L=4;%longitud 2 de la barra
c=0.1;%constante de propagación del calor en el medio
x=0:L/30:L;%tomamos 101 puntos en la
%barra de longitud L
t=0:2/100:2;
y=ones(1,length(x));%Sea desde y0 hasta y1 el espesor de la barra
y0=0*y;
y1=0.1*y;
M=[x x;y0 y1];
%plot(M(1,:),M(2,:),'ob')
for i=1:length(x)-1
caras(i,:)=[i i+1 i+length(x)+1 i+length(x)];
end
s=0;
for i=1:length(t)
for n=1:50
    s=s+2*L/(pi*n)*(-1)^(n-1)*sin(n*pi*x/L)*exp(-n^2*c^2*pi^2*t(i)/L^2);
end
%ar{i,1}=s;
%end
for k=1:length(s)-1
    v=s(k)*64/70;
patch('faces',caras(k,:),'vertices',M','facecolor',colorin(v),...
    'edgecolor',colorin(v))
end
pause(0.001)
end