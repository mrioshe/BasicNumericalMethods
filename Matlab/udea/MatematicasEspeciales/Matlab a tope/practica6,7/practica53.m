function practica53
uicontrol('style','text','position',[140 250 90 55],'string','Ingrese la funci�n f(z):','fonts',12);
u1=uicontrol('style','edit','position',[140 240 80 20]);
u2=uicontrol('style','edit','position',[140 221 80 20]);
uicontrol('style','text','position',[330 230 5 20],'string','|','fonts',10);
u3=uicontrol('style','edit','position',[335 230 50 20]);
uicontrol('style','text','position',[385 230 5 20],'string','|','fonts',10);
u8=uicontrol('style','popupmenu','position',[400 243 45 10],'string',{'<','>'},'fonts',12);
uicontrol('style','text','position',[335 260 90 55],'string','Ingrese el dominio:','fonts',12);
u4=uicontrol('style','edit','position',[448 230 15 20]);
uicontrol('style','pushbutton','position',[140 170 140 40],'callback',@boton_1,'string','Expandir ','FontSize',12);
u7=uicontrol('style','text','string','','position',[20 100 500 40],'FontSize',10);
    function boton_1(atr,tim);
        z=sym("z");
        u=sym("u");
        popupmenu=get(u8,'value');
        denominador=str2sym(get(u2,'string'));
        D=str2sym(get(u3,'string'));
        radio=str2sym(get(u4,'string'));
        raices_deno=solve(denominador);
        %raices_numerador=solve(numerador);
        a=get(u8,'value');
        switch a
            case 1
                f1=1;
                if str2sym(get(u1,'string'))== 1
                    if length(raices_deno)== 1
                        e=z-D;
                        b=z-denominador;
                        f2=0;
                        for i=0:8
                            f2=f2-((z-e)^i)/((b-e)^(i+1))
                        end
                        serie=string(f2);
                        salida=strcat(serie,' .....')
                        set(u7,'string',salida)
                    else
                        for i=1:length(raices_deno)
                            f1=f1*(z-raices_deno(i))
                        end
                    end
                else if length(solve(str2sym(get(u1,'string')))) <= 2
                        
                        for i=1:length(raices_deno)
                            if raices_deno(i) == abs(D-z)
                                raiz_e = raices_deno(i)
                            end
                        end
                        l=(z-raiz_e)
                        e=z-D;
                        fg=1;
                        ff=1;
                        numerador= str2sym(get(u1,'string'));
                        raices_numerador=solve(numerador);
                        for i=1:length(raices_deno)
                            ff= ff*(z-raices_deno(i))
                        end
                        for i=1:length(raices_numerador)
                            fg= fg*(z-raices_numerador(i))
                        end
                        f= fg/ff
                        f1 = f*l
                        f2 = subs(f1,l,u)
                        s = 1/u*taylor(f2)
                        t=subs(s,u,l)
                        serie=string(t);
                        salida=strcat(serie,' .....')
                        set(u7,'string',salida)
                        
                        
                    end
                end
                
            case 2
                if  str2sym(get(u1,'string')) ~= 1
                    if length(solve(str2sym(get(u1,'string')))) == 1 & D==str2sym(get(u1,'string'))
                        numerador=str2sym(get(u1,'string'));
                        if (numerador - z)-(denominador - z)== -radio
                            f2=0;
                            for i=0:8
                                f2=f2+(radio/(numerador))^i
                            end
                            serie=string(f2);
                            salida=strcat(serie,' .....')
                            set(u7,'string',salida)
                        else (numerador - z)-(denominador - z)== radio
                            f2=0;
                            for i=0:8
                                f2=f2+(-radio/(numerador))^i
                            end
                            serie=string(f2);
                            salida=strcat(serie,' .....')
                            set(u7,'string',salida)
                        end
                   else if length(solve(str2sym(get(u1,'string')))) <= 2
                            
                            for i=1:length(raices_deno)
                                if raices_deno(i) == abs(D-z)
                                    raiz_e = raices_deno(i)
                                end
                            end
                            l=(z-raiz_e)
                            e=z-D;
                            fg=1;
                            ff=1;
                            numerador= str2sym(get(u1,'string'));
                            raices_numerador=solve(numerador);
                            for i=1:length(raices_deno)
                                ff= ff*(z-raices_deno(i))
                            end
                            for i=1:length(raices_numerador)
                                fg= fg*(z-raices_numerador(i))
                            end
                            f= fg/ff
                            f1 = f*l
                            f2 = subs(f1,l,u)
                            f3 = f2/(u-radio)
                            f4 = f3/(1-radio/u)
                            s = 1/u^2*taylor(f3)
                            t=subs(s,u,l)
                            serie=string(t);
                            salida=strcat(serie,' .....')
                            set(u7,'string',salida)
                      end
                end
                    
                else
                        e=abs(z-D);
                        c=z-D;
                        b=sqrt(abs(z^2-denominador));
                        if length(raices_deno)== 2 & radio == abs(b-c)
                            if b == -c
                                f2=0;
                                for i=0:8
                                    f2=f2+(1/((z-c)^2))*((radio)/(z-c))^i
                                end
                                serie=string(f2);
                                salida=strcat(serie,' .....')
                                set(u7,'string',salida)
                            elseif b == c
                                f2=0;
                                for i=0:8
                                    f2=f2+((-1)^i)*(1/((z-c)^2))*((radio)/(z-c))^i
                                end
                                serie=string(f2);
                                salida=strcat(serie,' .....')
                                set(u7,'string',salida)
                                
                            end
                        end              
                    end  
               end
         end
    end