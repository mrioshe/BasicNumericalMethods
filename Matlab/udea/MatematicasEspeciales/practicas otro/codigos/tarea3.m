
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
f2=figure;
global uc uc4
syms w t
int1=get(uc,'String');
inter=str2num(int1(1,1));
F=0;
for k=1:inter
    func(1,k)=inputdlg(strcat('ingrese función ',num2str(k)));%strcat concatena
    f=inputdlg(strcat('ingrese intervalo ',num2str(k)));% 'func' e 'interv' son arreglos
    f=str2num(f{1,1});
    interv(k,:)=[f(1,1) f(1,2)];% se guarda el primer intervalo en 'f' para posteriormente guardarlos 
    %uno a uno en 'interv'
    
end
for k=1:inter
    a=str2sym(func{1,k});
    b=interv(k,:);
    F=int(a*exp(-1i*w*t),t,b);
end
W=-100:200/1000:100 ;
q=0;
[num,den]=numden(F);
d=solve(den);
for k=1:length(W)
    if W(1,k)==d
        q(1,k)=abs(subs(F,w,W(1,k)+0.01));
    else
    q(1,k)=abs(subs(F,w,W(1,k)));
    end
end
ancho=20/100;
area=0;
for k=1:length(W)
    area=area+ancho*q(1,k);
end

plot(W,q);
set(uc4, "String", num2str(area));
end
