
global uc uc4
f=figure
up=uipanel('title','Ingrese la funcion','fontsize',12,'BackgroundColor','white','position',[0.1 0.1 0.8 0.8])
uc=uicontrol(up,'style','edit','position',[10 240 200 50])
uc2=uicontrol(up,'style','text','position',[10 190 200 50],'fontsize',11);
uc3=uicontrol(up,'String','Push here','style','pushbutton','position',[10 110 200 50],'fontsize',11,'callback',@espec);
uc4=uicontrol(up,'style','text','position',[10 60 200 50],'fontsize',11);
%set(uc4, "String", 'Ingrese intervalo de definción')
set(uc2, "String", 'Ingrese numero de intervalos')

function espec(atributos,alarma)
syms n
f2=figure;
global uc uc4
syms w t
int1=get(uc,'String');
inter=str2num(int1(1,1));
F=0;
l=inputdlg('Ingrese la longitud:    ');
L=str2num(l{1,1});
for k=1:inter
    func(1,k)=inputdlg(strcat('Ingrese función ',num2str(k)));%strcat concatena
    f=inputdlg(strcat('Ingrese intervalo ',num2str(k)));% 'func' e 'interv' son arreglos
    f=str2num(f{1,1});
    interv(k,:)=[f(1,1) f(1,2)];% se guarda el primer intervalo en 'f' para posteriormente guardarlos 
    %uno a uno en 'interv'
    
end
x=linspace(0,2,101);
t=linspace(0,5,200);
m=0;
for k=1:inter
    a=str2sym(func{1,k});
    b=interv(k,:);
    esp=integrar(a,b,L);
    m=m+esp;
    
end

u=0;
for j=1:length(t)%desde uno hasta la longitud de t que sera 200"
    for k=1:30%va desde uno hasta 30 teniendo encuenta el recorrido desde uno hasta 200";
        q=eval(subs(m,n,k));
        u=u+q*cos((k)*pi/2*t(j))*sin((k)*pi/2*x);
    end
    plot(x,u)
    axis([0 2 -25 25])
    pause(0.005)
end
end

