function clase2
u1=uicontrol('style','edit','position',...
    [20 50 120 20]);
u=uicontrol('style','pushbutton','position',...
    [20 20 120 20],'callback',@editor1,...
    'string','pulse aquí')
% u1=uicontrol('style','text','position',...
%     [240 240 120 20]);
m=axes('position',[0.25 0.25 0.7 0.75])

function editor1(atributos,timbre)
a=get(u1,'string');
w=str2sym(a)
subplot(2,1,1)
ezplot(w)
% if a=="Hola"
%     set(u1,'string','como estas','FontSize',15)
%     x=-4:8/40:4;
%     y=x.^2;
%     plot(x,y)
% end
set(u1,'string',' ');
end
end