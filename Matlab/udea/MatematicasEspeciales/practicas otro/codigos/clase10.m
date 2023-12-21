function clase10
%x^3-3*x*y^2

f=figure
set(axes,'position',[0.5 0.5 0.35 0.4])
up=uipanel('title','Panel de entradas',...
    'fontsize',12,'position',[0.1 0.1 0.3 0.2])
uc1=uicontrol(up,'style','edit',...
    'position',[10 10 145 25],...
    'callback',@func1)
uc2=uicontrol(up,'style','text',...
   'position',[10 30 145 25])
set(uc2,'string')
end
function m=func1(atributos,evento)
syms x y
a=get(atributos,'string');
a=str2sym(a);
m=diff(a,x,2)
uc2=uicontrol(up,'style','text',...
    'position',[10 30 145 25])
set(uc2,'string',m)
end