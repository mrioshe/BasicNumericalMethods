function practica_20
u2=uicontrol('style','edit','position',[220 200 110 20],'callback',@editor1)
% u1=uicontrol('style','text','position',[240 240 120 20], 'callback',@editor1)
u3=uicontrol('style','edit','position',[220 290 110 20], 'callback',@editor2)
u4=uicontrol('style','text','string','Ingrese v(x,y)','position',[200 220 150 30],'fontsize',14, 'callback',@editor3)
u5=uicontrol('style','text','string','Ingrese u(x,y)','position',[200 310 150 30],'fontsize',14, 'callback',@editor4)
%u6=uicontrol('style','pushbutton','position',[20 80 110 20],'string','Gráficar mapeo','callback',@boton)
u7=uicontrol('style','text','position',[220 250 110 30],'string','ó','fontsize',14)
u8=uicontrol('style','text','position',[10 390 550 30],'string','Determinar si f(z)=f(u(x,y),jv(x,y)) es armónica y retornar f(z):','fontsize',14)
u9=uicontrol('style','text','position',[40 150 450 30],'fontsize',14)
u10=uicontrol('style','text','position',[40 110 450 30],'fontsize',14)
u11=uicontrol('style','text','position',[40 90 450 30],'fontsize',14)

% b=get(u2,'string');
    function editor2(atributos2,timbre2)
        a=get(atributos2,'string');
        z=sym("z");
        x=sym("x");
        y=sym("y");
        u=str2sym(a);
        set(atributos2,'string',' ')
        if diff(u,x,2)+diff(u,y,2)==0
            set(u9,'string','La función es armónica')
            g=-int(diff(int(diff(u,x),y),x),x)-int(diff(u,y),x);
            v=(int(diff(u,x),y)+g);
            f1=u+1i*v;
            %salida1=strcat('la función es : ',' ', string(f1));
            %set(u10,'string',salida1);
            f=subs(f1,{x y},{z,0});
            salida=strcat('la función f(z) es : ',' ', string(f),' + k');
            set(u11,'string',salida);
        else
            set(u9,'string','la función no es armónica');
        end
    end
    function editor1(atributos1,timbre2)
        b=get(atributos1,'string');
        z=sym("z");
        x=sym("x");
        y=sym("y");
        v=str2sym(b);
        set(atributos1,'string',' ')
        if diff(v,x,2)+diff(v,y,2)==0
            set(u9,'string','La función es armónica')
            g=-int(diff(int(diff(v,y),x),y),y)-int(diff(v,x),y);
            u=(int(diff(v,y),x)+g);
            f1=u+1i*v;
           % salida1=strcat('la función es : ',' ', string(f1));
            %set(u10,'string',salida1);
            f=subs(f1,{x y},{z,0});
            salida=strcat('la función f(z) es : ',' ', string(f),' + k');
            set(u11,'string',salida);
        else
            set(u9,'string','la función no es armónica');
        end
    end
end
