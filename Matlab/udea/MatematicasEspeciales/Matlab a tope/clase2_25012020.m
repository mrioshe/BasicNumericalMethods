function clase2_25012020
u=uicontrol('style','edit','position',...
    [20 20 120 20],'callback',@editor1);
u1=uicontrol('style','text','position',...
    [240 240 120 20],'callback',@editor1);
m=axes('position',[0.25 0.25 0.7 0.75])
function editor1(atributos,timbre)
a=get(atributos,'string');
if a=='hola'
    set(u1,'string','como estas','FontSize',15)
    x=-4:8/40:4;
    y=x.^2;
    plot(x,y)
end
set(atributos,'strings','');
end
end