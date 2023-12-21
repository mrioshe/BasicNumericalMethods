function practica40
u1=uicontrol('style','edit','position',[210 200 110 20],'string','soy u1');%'callback'%,@editor1)
u2=uicontrol('style','edit','position',[210 290 110 20]);% 'callback')%,@editor2)
u3=uicontrol('style','text','string',' Ingrese f(z):','position',[190 220 150 30],'fontsize',14, 'callback',@editor1);
u4=uicontrol('style','text','string','Ingrese el dominio D','position',[120 310 300 30],'fontsize',14, 'callback',@editor2);
%u5=uicontrol('style','popupmenu','string',{'','dx','dy'},'position',[300 290 60 20]);%, 'callback',@popm)
u6=uicontrol('style','text','position',[10 390 550 30],'string','Determinar  la integral de h(z)dz en un dominio cerrado D,','fontsize',12);
u12=uicontrol('style','text','position',[10 370 550 30],'string','Donde h(z)=f(z)/[((z-z1)^m1)*((z-z2)^m2)*....*((z-zn)^mn) ] ','fontsize',11);
u7=uicontrol('style','text','position',[20 110 550 20],'fontsize',14);
%u8=uicontrol('style','edit','position',[340 200 30 20])% 'callback',@editor3)
%u9=uicontrol('style','edit','position',[380 200 30 20])% 'callback',@editor4)
%u10=uicontrol('style','text','string',' Ingrese el intervalo:','position',[290 220 180 30],'fontsize',14, 'callback',@editor5);
u11=uicontrol('style','pushbutton','position',[210 150 110 20],'string','Calcular integral','callback',@boton);
    function boton(atributos,timbre)
        l=get(atributos,'value');
        if l == 1
            z=sym("z");
            u=str2sym(get(u1,'string'));
            d=str2sym(get(u2,'string'));
            raices=solve(u);
            m=1;
            for i=1:length(raices)
                if imag(raices(i))>0;
                    vpolos(m,1)=raices(i);
                    m=m+1;
                end
            end
            f1=1;
            for i=1:length(raices)
                f1=f1*(z-raices(i));
            end
            r=0;
            for i=1:length(vpolos)
                r=r+subs(simplify((z-vpolos(i))/f1),z,vpolos(i));
            end
              set(u1,'string',' ');
              set(u2,'string',' '); 
              integral = eval(2*pi*1i*r)
              set(u7,'string', integral);
        end
    end
end