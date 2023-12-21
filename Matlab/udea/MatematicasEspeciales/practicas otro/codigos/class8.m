function clase8

up=uipanel('title','Ingrese U',...
    "fontsize",12,"backgroundcolor", "white","position",[0.04 0.01 0.9 0.9])
uc=uicontrol(up,"style","edit", "position",[60 100 160 40],...
    "callback",@calculo)
uc2=uicontrol(up,"style","edit", "position",[250 100 160 40],...
    "callback",@calculo2)
uc1=uicontrol(up, "Style", "text", "position", [155 200 160 40])
uc3=uicontrol(up, "Style", "text","position", [60 60 160 40])
set(uc3, "String", 'Ingrese U')
uc4=uicontrol(up, "Style", "text","position", [250 60 160 40])
set(uc4, "String", 'Ingrese V')
    function m=calculo(atributos,evento)
    x=sym('x');
    y=sym('y');
    z=sym('z');
        th=get(atributos,"String");
        f=str2sym(th);
        m=diff(f,x,2)+ diff(f,y,2);
        if m== 0
            
            a=diff(f,x);
            b=int(a,y);
            c=-diff(f,y);
            d=diff(b,x);
            cte=c-d;
            rcte=int(cte,x);
            v=b+rcte;
            g=f+j*v;
            in1=inline(string(f));
            in2=inline(string(v));
            c1=in1(z,0);
            c2=in2(0,z);
            g2= c1+j*c2;
            set(atributos,"String", " ")
            set(uc1, "String", 'La funcion es armónica')
            set(uc1, "String", char(g2));
        else
            set(atributos,"String", " ")
            set(uc1, "String", 'La funcion no es armónica')
        end 
    end
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    function m=calculo2(atributos,evento)
    x=sym('x');
    y=sym('y');
    z=sym('z');
        th=get(atributos,"String");
        v=str2sym(th);
        m=diff(v,x,2)+ diff(v,y,2);
        if m== 0
            
            a=diff(v,x);
            b=int(a,y);
            c=diff(v,y);
            d=diff(b,x);
            cte=c-d;
            rcte=int(cte,x);
            f=-b+rcte;
            g=f+j*v;
            in1=inline(string(f));
            in2=inline(string(v));
            c1=in1(z,0);
            c2=in2(0,z);
            g2= c1+j*c2;
            set(atributos,"String", " ")
            set(uc1, "String", 'La funcion es armónica')
            set(uc1, "String", char(g2));
        else
            set(atributos,"String", " ")
            set(uc1, "String", 'La funcion no es armónica')
        end 


    end




end
