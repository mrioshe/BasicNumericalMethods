function practica41
uicontrol('style','text','position',[140 250 90 55],'string','Ingrese la funci�n h(z):','fonts',12);
u1=uicontrol('style','edit','position',[140 240 80 20]);
u2=uicontrol('style','edit','position',[140 221 80 20]);
uicontrol('style','text','position',[330 230 5 20],'string','|','fonts',10);
u3=uicontrol('style','edit','position',[335 230 50 20]);
uicontrol('style','text','position',[385 230 5 20],'string','|','fonts',10);
u8=uicontrol('style','popupmenu','position',[400 243 45 10],'string',{'<','>','<=','>='},'fonts',12);
uicontrol('style','text','position',[335 260 90 55],'string','Ingrese el dominio:','fonts',12);
u4=uicontrol('style','edit','position',[448 230 15 20]);
%uicontrol('style','text','position',[438 230 10 20],'string','�','fonts',12)
%uicontrol('style','text','position',[330 200 5 20],'string','|','fonts',14)
%u5=uicontrol('style','edit','position',[335 200 50 20])
%uicontrol('style','text','position',[385 200 5 20],'string','|','fonts',14)
%uicontrol('style','text','position',[400 200 10 20],'string','<','fonts',14)
%u6=uicontrol('style','edit','position',[418 200 10 20])
uicontrol('style','pushbutton','position',[140 170 140 40],'callback',@boton_1,'string','Calcular integral','FontSize',12);
u7=uicontrol('style','text','string','','position',[240 100 220 40],'FontSize',12);
    function boton_1(atr,tim);
        z=sym("z");
        u=str2sym(get(u2,'string'));
        raices=solve(u);
        a=get(u8,'value');
        switch a
            case 1
                m=1;
                n=0;
                for i=1:length(raices)
                    if abs(-(str2sym(get(u3,'string'))-z)-raices(i)) < str2sym(get(u4,'string'))
                        n=n+1;
                    end
                end
                if n == length(raices)
                    k1=0;
                    for j=1:length(raices)
                        for l=1:length(raices)
                            if raices(l)==raices(j)
                                k1=k1+1
                            end
                        end
                    end
                    if k1 > length(raices)
                        
                        fz=str2sym(get(u1,'string'));
                        vpolos(m,1)=raices(1);
                        f2=vpolos;
                        integral=(2*pi*1i*subs(diff(fz,z,length(raices)),z,f2))
                        inte=string(integral);
                        set(u7,'string',inte)
                        
                    else
                        for i=1:length(raices)
                            vpolos(m,1)=raices(i);
                            m=m+1;
                        end
                        f1=1;
                        for i=1:length(vpolos)
                            f1=f1*(z-vpolos(i));
                        end
                        r=0;
                        for i=1:length(vpolos)
                            fz=str2sym(get(u1,'string'));
                            r=r+subs((((z-vpolos(i))/f1)*(fz)),z,vpolos(i))
                        end
                        integral=eval(2*pi*1i*r)
                        inte=string(integral);
                        set(u7,'string',inte)
                    end
                    
                else
                    set(u7,'string','al menos un polo no hace parte del dominio D')
                end
            case 2
                m=1;
                n=0;
                for i=1:length(raices)
                    if abs(-(str2sym(get(u3,'string'))-z)-raices(i)) > str2sym(get(u4,'string'))
                        n=n+1;
                    end
                end
                if n == length(raices)
                    k1=0;
                    for j=1:length(raices)
                        for l=1:length(raices)
                            if raices(l)==raices(j)
                                k1=k1+1;
                            end
                        end
                    end
                    if k1 > length(raices)
                        
                        fz=str2sym(get(u1,'string'));
                        vpolos(m,1)=raices(1);
                        f2=vpolos;
                        integral=(2*pi*1i*subs(diff(fz,z,length(raices)),z,f2))
                        inte=string(integral);
                        set(u7,'string',inte)
                        
                    else
                        
                        for i=1:length(raices)
                            vpolos(m,1)=raices(i);
                            m=m+1;
                        end
                        f1=1;
                        for i=1:length(vpolos)
                            f1=f1*(z-vpolos(i));
                        end
                        r=0;
                        for i=1:length(vpolos)
                            fz=str2sym(get(u1,'string'));
                            r=r+subs((((z-vpolos(i))/f1)*(fz)),z,vpolos(i))
                        end
                        integral=eval(2*pi*1i*r)
                        inte=string(integral);
                        set(u7,'string',inte)
                    end
                else
                    set(u7,'string','Al menos un polo no hace parte del dominio D')
                end
            case 3
                m=1;
                n=0;
                for i=1:length(raices)
                    if abs(-(str2sym(get(u3,'string'))-z)-raices(i)) <= str2sym(get(u4,'string'))
                        n=n+1;
                    end
                end
                if n == length(raices)
                    k1=0;
                    for j=1:length(raices)
                        for l=1:length(raices)
                            if raices(l)==raices(j)
                                k1=k1+1;
                            end
                        end
                    end
                    if k1 > length(raices)
                        
                        fz=str2sym(get(u1,'string'));
                        vpolos(m,1)=raices(1);
                        f2=vpolos;
                        integral=(2*pi*1i*subs(diff(fz,z,length(raices)),z,f2))
                        inte=string(integral);
                        set(u7,'string',inte)
                        
                    else
                        
                        for i=1:length(raices)
                            vpolos(m,1)=raices(i);
                            m=m+1;
                        end
                        f1=1;
                        for i=1:length(vpolos)
                            f1=f1*(z-vpolos(i));
                        end
                        r=0;
                        for i=1:length(vpolos)
                            fz=str2sym(get(u1,'string'));
                            r=r+subs((((z-vpolos(i))/f1)*(fz)),z,vpolos(i))
                        end
                        integral=eval(2*pi*1i*r)
                        inte=string(integral);
                        set(u7,'string',inte)
                    end
                else
                    set(u7,'string','Al menos un polo no hace parte del dominio D')
                end
            case 4
                m=1;
                n=0;
                for i=1:length(raices)
                    if abs(-(str2sym(get(u3,'string'))-z)-raices(i)) >= str2sym(get(u4,'string'))
                        n=n+1;
                    end
                end
                if n == length(raices)
                    k1=0;
                    for j=1:length(raices)
                        for l=1:length(raices)
                            if raices(l)==raices(j)
                                k1=k1+1;
                            end
                        end
                    end
                    if k1 > length(raices)
                        
                        fz=str2sym(get(u1,'string'));
                        vpolos(m,1)=raices(1);
                        f2=vpolos;
                        integral=(2*pi*1i*subs(diff(fz,z,length(raices)),z,f2))
                        inte=string(integral);
                        set(u7,'string',inte)
                        
                    else
                        
                        for i=1:length(raices)
                            vpolos(m,1)=raices(i);
                            m=m+1;
                        end
                        f1=1;
                        for i=1:length(vpolos)
                            f1=f1*(z-vpolos(i));
                        end
                        r=0;
                        for i=1:length(vpolos)
                            fz=str2sym(get(u1,'string'));
                            r=r+subs((((z-vpolos(i))/f1)*(fz)),z,vpolos(i))
                        end
                        integral=eval(2*pi*1i*r)
                        inte=string(integral);
                        set(u7,'string',inte)
                    end
                else
                    set(u7,'string','Al menos un polo no hace parte del dominio D')
                end
        end
    end

end