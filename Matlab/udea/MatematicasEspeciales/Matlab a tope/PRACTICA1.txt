function practica_14
u2=uicontrol('style','edit','position',[20 160 110 20], 'callback',@editor1)
% u1=uicontrol('style','text','position',[240 240 120 20], 'callback',@editor1)
u3=uicontrol('style','edit','position',[20 290 110 20], 'callback',@editor2)
u4=uicontrol('style','text','string','Función compleja (w=f(z))','position',[20 180 110 30], 'callback',@editor3)
u5=uicontrol('style','text','string','Dominio ()','position',[20 310 110 30], 'callback',@editor4)
    function editor2 (atributos1,timbre1), editor1(atributos2,timbre2)
        z=sym("z");
        x=sym("x");
        y=sym("y");
        a=get(atributos1,'string');
        y=str2sym(a)
        z=x+j*y;
        subplot('position',[0.3 0.60 0.55 0.25])
        ezplot(y)
        
        f1=str2sym(get(atributos2,'string'));
        %z=x+1i*y;
        f=subs(f1,z,x+1i*y);
        u=real(f);
        v=imag(f);
        x1=-6:12/100:6;
        u1=eval(subs(u,x,x1));
        v1=eval(subs(v,x,x1));
        subplot('position',[0.3 0.15 0.55 0.25])
        plot(u1,v1)
        
      


%         b=get(atributos1,'string');
%         z=str2sym(b)
%         f=get(editor1,'string');
%         u=real (f);
%         v=imag(f);
%         x1=-6:12/100:6;
%         u1=eval(subs(u,x,x1));
%         v1=eval(subs(v,x,x1));
%         subplot('position',[0.3 0.15 0.55 0.25])
%         plot(u1,v1)
    end
end