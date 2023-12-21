function clase3a
figure
axes('position',[0.2 0.2 0.75 0.75])%ejes
axis([-2 2 -2 2])%escala
t=0:2*pi/100:2*pi;
%s=1:length(t)-1
x=cos(t);
y=sin(t);
z=ones(1,length(t))
m=[0.2*x x;0.4*y y;z 0*z];
for k=1:length(t)-1
    caras(k,:)=[k k+1 k+1+length(t) k+length(t)];
end
%g=plot3(m(1,:),m(2,:),m(3,:))
p=patch('faces',caras, 'vertices',m','facecolor',[0 0 0])
axis([-2 2 -2 2 -2 2])%escala
u=uicontrol('style', 'slider','position',[20 20 120 20], 'min',-pi,'max',pi,'callback',@s1_1)
    function s1_1(carolina,filomena)
        ang=get(carolina,'value');
        rot=[cos(ang) 0 -sin(ang) ;0 1 0; sin(ang) 0 cos(ang)];
        v=rot*m;
        c=(ang+pi)/(2*pi);
        %set(g,'xdata',m(1,:), 'ydata', v(2,:))
        set(p,'vertices',v','facecolor',[0 c c])
    end
end