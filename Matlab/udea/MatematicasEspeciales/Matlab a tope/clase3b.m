function clase3b
figure
axes('position',[0.2 0.2 0.75 0.75])%ejes
t=0:2*pi/4:2*pi;
%s=1:length(t)-1
x=cos(t);
y=sin(t);
z=ones(1,length(t))
m=[0.5*x x;0.5*y y;z 0*z];
v=m;
angy_ant=0;
angx_ant=0;
angz_ant=0;

for k=1:length(t)-1
    caras(k,:)=[k k+1 k+1+length(t) k+length(t)];
end
%g=plot3(m(1,:),m(2,:),m(3,:))
p=patch('faces',caras,'vertices',m',...
    'facecolor',[0 0 0])
axis([-2,2,-2,2,-2,2])%escala (%) significa comentario
uicontrol('style','slider',...
    'position',[20 40 120 20],...
    'min',-pi,'max',pi,'callback',@sl_y);
uicontrol('style','slider',...
    'position',[20 60 120 20],...
    'min',-pi,'max',pi,'callback',@sl_x);
uicontrol('style','slider',...
    'position',[20 20 120 20],...
    'min',-pi,'max',pi,'callback',@sl_z);
    function sl_y(carolina,filomena)
        angy_act=get(carolina,'value');
        ang=angy_act-angy_ant;
        rot=[cos(ang) 0 -sin(ang);...
            0 1 0;...
            sin(ang) 0 cos(ang)];
        v=rot*v;
        c=(ang+pi)/(2*pi);
        %set(g,'xdata',v(1,:),'ydata',v(2,:))
        set(p,'vertices',v','facecolor',[0.5 0.2 0.7])
        angy_ant=angy_act,
    end
    function sl_x(carolina,filomena)
        angx_act=get(carolina,'value');
        ang=angx_act-angx_ant;
        rot=[1 0 0;0 cos(ang) -sin(ang);...
            0 sin(ang) cos(ang)];
        v=rot*v;
        c=(ang+pi)/(2*pi);
        %set(g,'xdata',v(1,:),'ydata',v(2,:))
        set(p,'vertices',v','facecolor',[0.6 0.5 0.25])
        angx_ant=angx_act;
    end
    function sl_z(carolina,filomena)
        angz_act=get(carolina,'value');
        ang=angz_act-angz_ant;
        rot=[cos(ang) -sin(ang) 0;...
            sin(ang) cos(ang) 0;...
            0 0 1];
        v=rot*v;
        c=(ang+pi)/(2*pi);
        %set(g,'xdata',v(1,:),'ydata',v(2,:))
        set(p,'vertices',v','facecolor',[c 0 0])
    end
end




