function practica71
uicontrol('style','text','position',[20 385 500 40],'string','Hallar espectro de una señal f(t) y su Potencia media','fonts',16);
uicontrol('style','pushbutton','position',[210 240 140 40],'string','Calcular y graficar ','FontSize',12,'callback',@boton_1);
funcione=uicontrol('style','edit','position',[300 320 150 20]);
intervalo=uicontrol('style','edit','position',[300 345 150 20],'fonts',12);
uicontrol('style','text','position',[100 350 200 25],'string','Ingrese el periodo:','fonts',15);
uicontrol('style','text','position',[100 320 200 25],'string','Ingrese la función :','fonts',15);
potenciamedia=uicontrol('style','text','position',[75 290 300 25],'string',' ','fonts',15);
    function boton_1(atr,tim);
        t=sym("t");
        n=sym("n");
        T = str2sym(get(intervalo, 'string'));
        f = str2sym(get(funcione, 'string'));
        w0= 2*pi/T;
        cn=1/T*int(f*exp(-1*i*n*w0*t),t,-T/2,T/2);
        for k=1:27;
            if k-14~= 0;
                ci(1,k)=abs(eval(subs(cn,n,k-14)))
            else
                ci(1,k)=abs(eval(limit(cn,n,0)))
            end
            nw0(1,k) =(k-14)*w0;
        end
        subplot('position',[0.05 0.05 0.90 0.50])
        plot(nw0,ci,'o')
        hold on
        plot(nw0,ci)
        pm =0
        for c=1:27
            pm = pm + ci(1,c)
        end
        salida = strcat('Potencia media: ',' ',string(pm))
        set(potenciamedia,'string',salida) 
        
    end
end