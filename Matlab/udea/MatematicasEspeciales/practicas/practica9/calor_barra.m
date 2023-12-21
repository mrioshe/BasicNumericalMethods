x=sym("x");
n=sym("n");
L=4;%longitud 2 de la barra
c=1;%constante de propagación del calor en el medio
f=x
F=2/L*int(f*sin(n*pi*x/L),x,0,L);
x1=0:L/30:L;%tomamos 101 puntos en la
%barra de longitud L
t=0:2/70:2;
y=ones(1,length(x1));%Sea desde y0 hasta y1 el espesor de la barra
y0=0*y;
y1=0.1*y;
M=[x1 x1;y0 y1];
%plot(M(1,:),M(2,:),'ob')
for i=1:length(x1)-1
    caras(i,:)=[i i+1 i+length(x1)+1 i+length(x1)];
end
s=0;
ss = {};
for p=1:length(t)
    ss(1,p)={subs(F*sin(n*pi*x/L)*exp(-n^2*c^2*pi^2*t(i)/L^2),{x},{x1})};
end
for i=1:length(t)
    for n=1:15
        s=s+eval(subs(ss(1,i),{sym("n")},{n}));
    end
    %ar{i,1}=s;
    %end
    for k=1:length(s)-1
        v=s(k)*64/70;
        subplot('position',[0.05 0.05 0.90 0.50])
        patch('faces',caras(k,:),'vertices',M','facecolor',colorin(v),...
            'edgecolor',colorin(v))
    end
    pause(0.001)
end