function clase3
figure
axes('position',[0.2 0.2 0.75 0.75])%ejes
axis([-2 2 -2 2])%escala
t=0:2*pi/20:2*pi;
s=1:length(t)-1
x=cos(t);
y=sin(t);
m=[x;y]
%g=plot(x,y)
p=patch('faces',s, 'vertices',m','facecolor','m')
axis([-2 2 -2 2])%escala
u=uicontrol('style', 'slider','position',[20 20 120 20], 'min',-pi,'max',pi,'callback',@s1_1)
    function s1_1(carolina,filomena)
        ang=get(carolina,'value');
        rot=[cos(ang) -sin(ang); sin(ang) cos(ang)];
        v=rot*m;
        c=(ang+pi)/(2*pi);
        %set(g,'xdata',m(1,:), 'ydata', v(2,:))
        set(p,'vertices',v','facecolor',[0 c c])
    end
end