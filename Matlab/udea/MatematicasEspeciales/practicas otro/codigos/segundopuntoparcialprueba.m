function segundopuntoparcial
global uc7
f=figure;

up=uipanel('title','Mapeo de Funciones.','fontsize',14,'BackgroundColor','white','position',[0.08 0.05 0.8 0.9]);

uc1=uicontrol(up,'style','edit','position',[180 300 150 38],'callback',@primerdominio);

uc2=uicontrol(up,'style','text','position',[20 300 150 38],'string','Ingrese el primer dominio:','fontsize',11);

uc3=uicontrol(up,'style','edit','position',[180 250 150 38],'callback',@segundodominio);

uc4=uicontrol(up,'style','text','position',[20 250 150 38],'string','Ingrese el segundo dominio:','fontsize',11);

uc5=uicontrol(up,'style','edit','position',[220 200 150 35],'callback',@mapeo);

uc6=uicontrol(up,'style','text','position',[20 200 200 35],'string','Ingrese la funcion a mapear:','fontsize',11);

uc7=uicontrol(up,'style','text','position',[20 140 420 50]);

end

function primerdominio(atributos,evento)
global a1
a=get(atributos,'string');
a1=str2sym(a);
end


function segundodominio(atributos,evento)
global b1
b=get(atributos,'string');
b1=str2sym(b);
end

function mapeo(atributos,evento)
syms x y z t
global uc7 a1 b1

p=-10:20/100:10;
a2=eval(subs(a1,x,p));
b2=eval(subs(b1,x,p));
f2=figure;

c=get(atributos,'string');
c=str2sym(c);


% u=simplify(real(c1));
% v=imag(c1);

% z=x+j*y;  ^^^^
u=subs(real(c),z,x+1i*y);
v=subs(imag(c),z,x+1i*y);
if diff(u,x)==diff(v,y)& diff(u,y)==-diff(v,x)
    set(uc7,'string','Este mapeo es conforme y conserva los ángulos de corte de los dominios','fontsize',11);
else
    set(uc7,'string','Este mapeo no es conforme y puede NO conservar los ángulos de corte de los dominios','fontsize',11);
end

%g=x+j*y;
%m=real(g);
%n=imag(g);
%for k=1:length(p)
    %m1(1,k)=eval(subs(m,a2(k)+i*p(k)));
   % n1(1,k)=eval(subs(n,a2(k)+i*p(k)));
  %  m2(1,k)=eval(subs(m,p(k)+i*b2(k)));
 %   n2(1,k)=eval(subs(n,p(k)+i*b2(k)));
%end

%subplot(2,1,1);
%plot(m1,n1,'r')
%hold on
%plot(m2,n2,'b')




for k=1:length(p)
    u1(1,k)=eval(subs(u,a2(k)+i*p(k)));
    v1(1,k)=eval(subs(v,a2(k)+i*p(k)));
    u2(1,k)=eval(subs(u,p(k)+i*b2(k)));
    v2(1,k)=eval(subs(v,p(k)+i*b2(k)));
end

subplot(2,1,2)
plot(u1,v1,'r')
hold on
plot(u2,v2,'b')

end

