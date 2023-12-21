global uc uc2 uc5 uc1
f=figure
set(axes,'position',[0.5 0.5 0.35 0.4])
up=uipanel('title','Mapeo ',...
    "fontsize",12,"backgroundcolor", "white","position",[0.04 0.01 0.9 0.9])
uc=uicontrol(up,"style","edit", "position",[60 100 160 40])
uc2=uicontrol(up,"style","edit", "position",[250 100 160 40])
uc5=uicontrol(up,"style","edit", "position",[155 190 160 40])
uc1=uicontrol(up, "Style", "text", "position", [155 150 160 40])
uc3=uicontrol(up, "Style", "text","position", [60 60 160 40])
set(uc3, "String", 'Ingrese Dominio 1')
uc6=uicontrol(up,'String','Push here','Style', 'pushbutton', 'position', [155 20 160 40],...
    'callback',@mape)
uc4=uicontrol(up, "Style", "text","position", [250 60 160 40])
set(uc4, "String", 'Ingrese Dominio 2')
set(uc1, "String", 'Ingrese Mapeo')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function mape(atributos,evento)
global uc uc2 uc5 uc1
%a=ones(1,101);


%b1=2*ones(1,101);
syms x y z t
%x=sym('x');
%y=sym('y');
%z=sym('z');
%t=sym('t');


D1=str2sym(get(uc,'String'));
D2=str2sym(get(uc2,'String'));
%y1=x^2;
%y2=2*x*y;
z=x+j*y;
Mp=str2sym(get(uc5,'String'));
u=subs(real(Mp),z,x+1i*y);
v=subs(imag(Mp),z,x+1i*y);
if diff(u,x)==diff(v,y) & diff(u,y)== -diff(v,x);
    set(uc1, "String", 'Mapeo conforme')
    
else
    set(uc1, "String", 'Mapeo no conforme');
    
    
end

t1=-1:2/100:1;
w1=eval(subs(D1,x,t1));
t2=-1:2/100:1;
w2=eval(subs(D2,x,t2));
f2=figure;

for k=1:length(t1)
    u1(1,k)=eval(subs(u,t1(k)+i*w1(k)));
    v1(1,k)=eval(subs(v,t1(k)+i*w1(k)));
    u2(1,k)=eval(subs(u,t2(k)+i*w2(k)));
    v2(1,k)=eval(subs(v,t2(k)+i*w2(k)));
end
subplot(2,1,2);
plot(u1,v1,'r');
hold on;
plot(u2,v2,'m');
end

