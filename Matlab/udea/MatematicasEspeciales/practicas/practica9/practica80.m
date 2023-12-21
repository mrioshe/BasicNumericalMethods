function practica80
uicontrol('style','text','position',[20 385 500 40],'string','Simulación onda viajera','fonts',17);
uicontrol('style','text','position',[10 360 400 25],'string','Ingrese los intervalos de los tramos :','fonts',15);
uicontrol('style','text','position',[10 325 350 25],'string','Ingrese la deformación inicial f(x):','fonts',15);
uicontrol('style','pushbutton','position',[210 210 140 40],'string','Simular','FontSize',12,'callback',@boton_1);
intervalo=uicontrol('style','edit','position',[380 355 150 20],'fonts',12);
funcione=uicontrol('style','edit','position',[330 325 150 20]);
uicontrol('style','text','position',[10 290 400 25],'string','Ingrese la longitud de la cuerda:','fonts',15);
longitud=uicontrol('style','edit','position',[350 290 150 20],'fonts',12);
constante=uicontrol('style','edit','position',[310 260 150 20],'fonts',12);
uicontrol('style','text','position',[80 260 220 25],'string','Ingrese la constante c:','fonts',15);


    function boton_1(atr,tim);
        
        x=sym("x");
        n=sym("n");
        inter = str2num(get(intervalo, 'string'));
        funciones = str2sym(get(funcione, 'string'));
        c=str2num(get(constante, 'string'));
        L=str2num(get(longitud, 'string'));
        
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
        
        F=0;
        for i=1:length(funciones)
            interv=intervalos{1,i};
            f=functions{1,i};
            %a0=a0+2/T*int(f,t,interv);
            %an=an+2/T*int(f*cos(n*w0*t),t,interv);
            %bn=bn+2/T*int(f*sin(n*w0*t),t,interv);
            F=F+2/L*int(f*sin(n*pi*x/L),x,interv);
            %F2=2/L*int(f2*sin(n*pi*x/L),x,interv);
            %F=F1;
        end
        
        
        t=0:0.1:20;
        x1=0:L/50:L;
        
        %syms x n
       % f1=sin(x);
        %f2=L-x;
       % F1=2/L*int(f1*sin(n*pi*x/L),x,[0 L/2]);
        %F2=2/L*int(f2*sin(n*pi*x/L),x,[L/2 L]);
        %F=F1;
        
        
        ss = {};
        for i=1:length(t)
            s=0;
            ss(1,i)={subs(F*cos(n*pi*c*t(i)/L)*sin(n*pi*x/L),{x},{x1})};
        end
        for i=1:length(t)
            s=0;
            for k=1:5
                s=s+eval(subs(ss(1,i),{n},{k}));
            end
            subplot('position',[0.05 0.05 0.90 0.50])
            plot(x1,s)
            axis([-0.1 L+0.1 -L L])
            pause(0.005)
        end
        
    end
end