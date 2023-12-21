function practica_15
u2=uicontrol('style','edit','position',[20 160 110 20])%, %'callback',@editor1)
% u1=uicontrol('style','text','position',[240 240 120 20], 'callback',@editor1)
u3=uicontrol('style','edit','position',[20 290 110 20])%, 'callback',@editor2)
u4=uicontrol('style','text','string','Función compleja (f(z))','position',[20 180 110 30], 'callback',@editor3)
u5=uicontrol('style','text','string','Dominio (f(x))','position',[20 310 110 30], 'callback',@editor4)
u6=uicontrol('style','pushbutton','position',[20 80 110 20],'string','Gráficar mapeo','callback',@boton)
u7=uicontrol('style','text','position',[267 175 110 30],'fontsize',14)
    function boton(atributos2,timbre2)
            c=get(atributos2,'value');
        
        if c == 1
            z=sym("z");
            x=sym("x");
            y=sym("y");
            a=get(u3,'string');
            y=str2sym(a);
            subplot('position',[0.3 0.60 0.55 0.25])
            ezplot(y)
            f1=str2sym(get(u2,'string'));
            f=subs(f1,z,x+1i*y);
            u=real(f);
            v=imag(f);
            x1=-6:12/1000:6;
            u1=eval(subs(u,x,x1));
            v1=eval(subs(v,x,x1));
            subplot('position',[0.3 0.15 0.55 0.25])
            plot(u1,v1)
            set(u7,'string',' f(z)')
            set(u3,'string',' ')
            set(u2,'string',' ')
        end
    end
end