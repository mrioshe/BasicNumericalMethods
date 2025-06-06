function practica61
uicontrol('style','text','position',[140 385 300 40],'string','Simulación series de Fourier','fonts',17);
uicontrol('style','text','position',[30 350 300 25],'string','Ingrese los intervalos :','fonts',15);
uicontrol('style','text','position',[30 300 300 25],'string','Ingrese los funciones :','fonts',15);
uicontrol('style','pushbutton','position',[230 240 140 40],'string','Graficar ','FontSize',12,'callback',@boton_1);
%uicontrol('style','pushbutton','position',[390 210 140 40],'callback',@boton_1,'string','Ingresar intervalos ','FontSize',12);
intervalo=uicontrol('style','edit','position',[280 345 200 20],'fonts',12);
%uicontrol('style','text','position',[0 180 200 80],'string','f(t)= ','fonts',40);
%uicontrol('style','text','position',[150 150 50 40],'string','{ ','fonts',15);
funcione=uicontrol('style','edit','position',[280 300 200 20]);
%u2=uicontrol('style','edit','position',[270 270 100 20]);
%u3=uicontrol('style','edit','position',[270 240 100 20]);
%u4=uicontrol('style','edit','position',[270 210 100 20]);
%u5=uicontrol('style','edit','position',[270 180 100 20]);
%u6=uicontrol('style','edit','position',[270 150 100 20]);
%u7=uicontrol('style','edit','position',[270 120 100 20]);
%u8=uicontrol('style','edit','position',[270 90 100 20]);
%u9=uicontrol('style','edit','position',[270 60 100 20]);
%u10=uicontrol('style','edit','position',[270 30 100 20]);
    function boton_1(atr,tim);

        t=sym("t");
        n=sym("n");
        inter = str2num(get(intervalo, 'string'));
        funciones = str2sym(get(funcione, 'string'));
        
        functions={};
        for i=1:length(funciones)
            functions(1,i)= {funciones(i)}
        end
        
        intervalos={};
        l=0;
        for i=1:length(inter)/2
            intervalos(1,i)={[inter(1,i+l) inter(1,i+1+l)]}
            l=l+1;
        end

        %ar={t+1,-t+1,0}
        %arintv={[-1 0],[0 1],[1 2]};
        a1=intervalos{1,1};
        a2=intervalos{1,length(intervalos)};
        T=a2(2)-a1(1);
        w0=2*pi/T;
        a0=0;an=0;bn=0;
        for i=1:length(funciones)
            interv=intervalos{1,i};
            f=functions{1,i};
            a0=a0+2/T*int(f,t,interv);
            an=an+2/T*int(f*cos(n*w0*t),t,interv);
            bn=bn+2/T*int(f*sin(n*w0*t),t,interv);
        end
        s0=1/2*a0;
        sn=an*cos(n*w0*t)+bn*sin(n*w0*t);
        s=0;
        t1=-1:6/100:5;
        for k=1:50
            s=s+eval(subs(sn,{n t},{k t1}));
            s1=s+eval(s0);
            subplot('position',[0.05 0.05 0.90 0.50])
            plot(t1,s1)
            pause(0.1)
        end
    end
end
