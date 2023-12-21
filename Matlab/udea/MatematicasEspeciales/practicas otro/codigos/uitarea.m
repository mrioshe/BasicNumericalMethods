function class8
h=figure
set(axes,"position",[0.5 0.5 0.3 0.4])
A=[0 0;0 1];
g=plot(A(1,:),A(2,:))
axis([-2 2 -2 2])
up=uipanel('title','panel principal',...
    "fontsize",12,"backgroundcolor", "white","position",[0.1 0.1 0.3 0.3])
uc=uicontrol(up,"style","edit", "position",[10 10 150 20],...
    "callback",@movimiento)
uc1=uicontrol(up, "Style", "text", "position", [10 40 150 20])
    function movimiento(atributos,llamado_a_subrutinas)
        A=[0 0;0 1]
        th=str2num(get(atributos,"String"))*pi/180;
        rot=[cos(th) -sin(th);sin(th) cos(th)];
        v=rot*A;
        set(g, "Xdata",v(1,:), "Ydata",v(2,:))
        set(atributos,"String", " ")
        set(uc1, "String", "Hola pues")
        
    end
end