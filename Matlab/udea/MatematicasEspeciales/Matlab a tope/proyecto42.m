function proyecto42
p=figure('name','Proyecto #4','menubar','none','position',[200 200 700 600],'color',[1 1 1]);
movegui(p,'center');
uicontrol('style','text','string','Práctica 4','position',[180 500 360 80],'backgroundcolor',[1 1 1],'FontSize',25,'FontWeight','bold');  % Practice Name
uicontrol('style','text','string','Ingrese la función:','position',[100 400 200 40],'backgroundcolor',[1 1 1],'FontSize',15); % Name of the function
uicontrol('style','text','string','Ingrese el dominio:','position',[100 310 200 40],'backgroundcolor',[1 1 1],'FontSize',15); % Nombre dominio
uicontrol('style','text','position',[300,325,10,20],'backgroundcolor',[1 1 1],'string','|')
uicontrol('style','edit','position',[310,325,60,20])
uicontrol('style','text','position',[380,325,10,20],'backgroundcolor',[1 1 1],'string','|')
uicontrol('style','text','position',[390,325,10,20],'backgroundcolor',[1 1 1],'string','>')
uicontrol('style','edit','position',[400,325,60,20])

uicontrol('style','text','position',[300,294,10,20],'backgroundcolor',[1 1 1],'string','|')
uicontrol('style','edit','position',[310,294,60,20])
uicontrol('style','text','position',[380,294,10,20],'backgroundcolor',[1 1 1],'string','|')
uicontrol('style','text','position',[390,294,10,20],'backgroundcolor',[1 1 1],'string','<')
uicontrol('style','edit','position',[400,294,60,20])
c=uicontrol('style','edit','position',[340 425 200 30],'backgroundcolor',[1 1 1],'FontSize',15); % la funcion z
% uicontrol('style','text','string','---------------------------','position',[340 400 200 23],'backgroundcolor',[1 1 1],'FontSize',15);
c1=uicontrol('style','edit','position',[340 397 200 30],'backgroundcolor',[1 1 1],'FontSize',15); % la funcion z
% c2=uicontrol('style','edit','position',[340 315 200 30],'backgroundcolor',[1 1 1],'FontSize',15); % Donde ingresar el dominio
uicontrol('style','pushbutton','position',[200 230 140 40],'callback',@boton_1,'string','Ejecutar','FontSize',13); % Button to execute the actions
uicontrol('style','pushbutton','position',[400 230 140 40],'callback',@boton_2,'string','Limpiar','FontSize',13);  % Button to clean all
c2=uicontrol('style','text','string','','position',[100 100 500 40],'backgroundcolor',[1 1 1],'FontSize',14); % In this part will show the answer

    function boton_1(atr,tim);
        z=sym("z");
        u=str2sym(get(c1,'string'))
        raices=solve(u)
        m=1;
        for i=1:length(raices)
            %   if imag(raices(i))>0
            % if raices(i)~=1
                vpolos(m,1)=raices(i)
                m=m+1;
%             end
        end
        f1=1;
        for i=1:length(raices)
            f1=f1*(z-raices(i))
        end
        r=0;
        for i=1:length(vpolos)
            u1=str2sym(get(c,'string'))
            r=r+subs((((z-vpolos(i))/f1)*(u1)),z,vpolos(i))
        end
        integral=eval(2*pi*1i*r)
        inte=string(integral)
        set(c2,'string',inte)
    end
    function boton_2(atr,tim)
        set(c,'string','')
        set(c1,'string','')
        set(c2,'string','')
    end
end