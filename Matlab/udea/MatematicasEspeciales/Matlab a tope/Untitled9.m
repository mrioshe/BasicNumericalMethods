u2=uicontrol('style','edit','position',[20 160 110 20], 'callback',@editor1)
        syms  x y f z u v
        y=str2sym(get(u2,'string'));
        subplot('position',[0.3 0.60 0.55 0.25])
        ezplot(y)
        z=x+1i*y;
        f=cos(z)
        u=real (f);
        v=imag(f);
        x1=-6:12/100:6;
        u1=eval(subs(u,x,x1));
        v1=eval(subs(v,x,x1));
        syms 
        subplot('position',[0.3 0.18 0.55 0.25])
        plot(u1,v1)