function practica_12
u=uicontrol('style','edit','position',[20 160 110 20], 'callback',@editor1)
% u1=uicontrol('style','text','position',[240 240 120 20], 'callback',@editor1)
u1=uicontrol('style','edit','position',[20 290 110 20], 'callback',@editor2)
u2=uicontrol('style','text','string','Función compleja','position',[20 180 110 20], 'callback',@editor3)
u3=uicontrol('style','text','string','Dominio','position',[20 310 110 20], 'callback',@editor4)
m=axes('position',[0.3 0.25 0.55 0.25])
x = linspace(0,10);
y = cos(x);
plot(x,y)
m2=axes('position',[0.3 0.60 0.55 0.25])
x = linspace(0,10);
y = g();
plot(x,y)
function editor1(atributos,timbre)
a=get(atributos,'string');
w=str2sym(a)
subplot(2,1,1)
ezplot(w)
% if a=="hola"
%     set(u1,'string','como estas','FontSize', 15)
%     x=-4:8/40:4;
%     y=x.^2;
%     plot(x,y)
% end
set(atributos,'string',' ');
end
end