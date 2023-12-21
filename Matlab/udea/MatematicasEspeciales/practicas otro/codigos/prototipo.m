%condiciones de cauchy riemman
%funcion analitica
%(x^3-3*x*y^2)+j*(3*x^2*y-y^3)
%función no analitica
global uc uc3 uc4
f=figure
up=uipanel('title','Ingrese la funcion','fontsize',12,'BackgroundColor','white','position',[0.1 0.1 0.8 0.8])
uc=uicontrol(up,'style','edit','position',[10 275 145 25])
uc2=uicontrol(up,'style','text','position',[10 190 400 50],'fontsize',11);
uc3=uicontrol(up,'style','edit','position',[10 160 400 25],'fontsize',11)
uc4=uicontrol(up,'style','edit','position',[10 130 400 25],'fontsize',11)
boton=uicontrol(up,'style','pushbutton','string','Calcular','backgroundcolor','yellow','position',[10 100 400 25],'callback',{@funcion1,uc,uc3,uc4})
graphs=axes(up,'position',[0.8 0.6 0.3 0.3],'Title','DOMINIO');
grafica=axes(up,'position',[0.45 0.6 0.3 0.3])

function funcion1(atributo, evento)
global uc uc3 uc4
x=sym ('x');
y=sym('y');
%z1=sym('z1')
z=sym('z')
z1=x+j*y;
u=eval(get(uc,'string')); % uc mapeo
u=subs(u,[z],[z1])
Re=real(u);
dRedx=diff(Re,x);
Im=imag(u);
dImdy=diff(Im,y);
dRedy=diff(Re,y);
dImdx=diff(Im,x);
if dImdy==dRedx & dRedy==-dImdx
    disp('Este mapeo es conforme y conserva los ángulos de corte de los dominios')
    set(uc2,'string','Este mapeo es conforme y conserva los ángulos de corte de los dominios')
else
    disp('Este mapeo no es conforme y puede no conservar los ángulos de corte de los dominios')
    set(uc2,'string','Este mapeo no es conforme y puede no conservar los ángulos de corte de los dominios')

end
a=eval(get(uc3,'string')); %D1

k=subplot(2,3,2),fplot(a,x),xlim([-20 20])
hold on
b=eval(get(uc4,'string')); %D2
g=subplot(2,3,2),fplot(b,'y')
hold off
uy=subs(Re,[x],[b]);
vy=subs(Im,[x],[b]);
ux=subs(Re,[y],[a]);
vx=subs(Im,[y],[a]);
n=[-1,1]
d=subplot(2,3,3),fplot(vx,ux,n)
hold on
m=subplot(2,3,3),fplot(vy,uy,n)
hold off

end

