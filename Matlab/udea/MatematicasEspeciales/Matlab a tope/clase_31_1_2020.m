function clase_31_1_2020
uicontrol('style','edit','position',[240 240 120 20],...
    'callback',@editor1);
t=uicontrol('style','text','position',[240 320 120 80])
    function editor1(atr,tim)
        z=sym("z");
        x=sym("x");
        y=sym("y");
        s=sym("s");
        f1=str2sym(get(atr,'string'));
        set(atr,'string',' ')
        %z=x+1i*y;
        f=subs(f1,z,x+1i*y);
        u=real(f);
        v=imag(f);
        dux=diff(u,x);
        dvy=diff(v,y);
        duy=diff(u,y);
        dvx=diff(v,x);
        if dux==dvy && duy==-dvx
            dz=dux+1i*dvx;
            dz1=real(subs(dz,{x y},{z 0}));
            salida=strcat('la funci�n es anal�tica y su derivada es: ',string(dz1));
            set(t,'String',salida)
        else
            set(t,'String','la funci�n no es anal�tica')
        end
    end
end
