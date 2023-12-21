function practica_15
u2=uicontrol('style','edit','position',[20 160 110 20])%, %'callback',@editor1)
% u1=uicontrol('style','text','position',[240 240 120 20], 'callback',@editor1)
u3=uicontrol('style','edit','position',[20 290 110 20])%, 'callback',@editor2)
u4=uicontrol('style','text','string','Función compleja (f(z))','position',[20 180 110 30], 'callback',@editor3)
u5=uicontrol('style','text','string','Dominio (f(x))','position',[20 310 110 30], 'callback',@editor4)
%u6=uicontrol('style','pushbutton','position',[20 80 110 20],'string','Gráficar mapeo','callback',@boton)
u7=uicontrol('style','text','position',[267 175 110 30],'fontsize',14)


   %halle el armónico conjugado de u=exp(y)cos(x)
syms x y z
u=exp(y)*cos(x);
if diff(u,x,2)+diff(u,y,2)==0
    disp('la funcion es armonica')
    g=-int(diff(int(diff(u,x),y),x),x)-int(diff(u,y),x);
    v=(int(diff(u,x),y)+g);
    f1=u+1i*v;
    f=subs(f1,{x y},{z,0});
else
    disp('la función no es armónica')
end
end