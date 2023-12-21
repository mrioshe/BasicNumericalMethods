function tarea_3
syms n 
a=inputdlg('igrese la longitud:    ');
q=str2num(a{1,1});
b=inputdlg('igrese el número de intervalos:    ');
p=str2num(b{1,1});
x=linspace(0,q,101);
t=linspace(0,5,200);
for i=1:p
    funcion(1,i)=inputdlg(strcat('ingrese función ',num2str(i)));
    valores(1,i)=inputdlg(strcat('ingrese intervalo ',num2str(i)));
    var=str2num(valores{1,i});
    intervalos(i,:)=[var(1,1),var(1,2)];
end
m=0
for i=1:p
    a=str2sym(funcion{1,i});
    o=intervalos(i,:);
    esp=integrar(a,o,q);
    m=m+esp;
end

u=0;
for j=1:length(t)%desde uno hasta la longitud de t que sera 200"
    for k=1:30%va desde uno hasta 30 teniendo encuenta el recorrido desde uno hasta 200";
        u=u+subs(m*cos((2*k-1)*pi/2*t(j))*sin((2*k-1)*pi/2*x),n,2*k-1);
    end
    plot(x,u)
    axis([0 2 -25 25])
    pause(0.005)
end
end



