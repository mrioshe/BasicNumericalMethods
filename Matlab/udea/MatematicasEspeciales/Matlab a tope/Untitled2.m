function Untitled2
figure
axes('position',[0.3 0.3 0.65 0.65])
t=0:2*pi/4:2*pi;
x=cos(t);
y=sin(t);
M=[x;y];
f=patch('faces', [1 2 3 4],'vertices',M','facecolor',[0 1 1],'edgecolor',[0 1 1])
axis([-2 2 -2 2])
ui=uicontrol('style','slider',...
    'position',[20 20 120 40],...
    'min',-8,'max',8,'sliderstep',[0.05 0.1],...
    'callback',@slider1)

    function slider1(atributos,evento)
        a=get(atributos, 'value')+8;
        w=color1(a)
        set(f,'facecolor', w,'edgecolor',w)
    end
end