function proyecto5
p=figure('name','Proyecto #5','menubar','none','position',[200 200 700 600],'color',[1 1 1]);
movegui(p,'center');
uicontrol('style','text','string','Series de Laurent','position',[180 500 360 80],'backgroundcolor',[1 1 1],'FontSize',25,'FontWeight','bold');  % Practice Name
uicontrol('style','text','string','Ingrese la función:','position',[100 400 200 40],'backgroundcolor',[1 1 1],'FontSize',15); % Name of the function
uicontrol('style','text','string','Ingrese el dominio:','position',[100 310 200 40],'backgroundcolor',[1 1 1],'FontSize',15); % Nombre dominio
uicontrol('style','text','position',[300,328,10,25],'backgroundcolor',[1 1 1],'string','|','FontSize',15)
c3=uicontrol('style','edit','position',[310,325,90,25],'FontSize',15)  % dom
uicontrol('style','text','position',[400,328,10,25],'backgroundcolor',[1 1 1],'string','|','FontSize',15)
uicontrol('style','popupmenu','string',{'','<','>'},'position',[410 335 45 20],'FontSize',15,'callback',@popMenu); % To choose the function we are going to work
c4=uicontrol('style','edit','position',[460,325,50,25],'FontSize',15)  % dom2
c=uicontrol('style','edit','position',[340 425 200 30],'backgroundcolor',[1 1 1],'FontSize',15); % num
c1=uicontrol('style','edit','position',[340 397 200 30],'backgroundcolor',[1 1 1],'FontSize',15); % den
uicontrol('style','pushbutton','position',[200 230 140 40],'callback',@boton_1,'string','Ejecutar','FontSize',13); % Button to execute the actions
uicontrol('style','pushbutton','position',[400 230 140 40],'callback',@boton_2,'string','Limpiar','FontSize',13);  % Button to clean all
c2=uicontrol('style','text','string','','position',[20 30 660 150],'backgroundcolor',[1 1 1],'FontSize',14); % In this part will show the answer

function popMenu(prp,h)
       a=get(prp,'value');
       switch a
       case 2
           w=1;
       case 3
           w=2;
       end
uicontrol('style','pushbutton','position',[200 230 140 40],'callback',@boton_1,'string','Ejecutar','FontSize',13); % Button to execute the actions
    function boton_1(atr,tim)
        z=sym("z");
        num=str2sym(get(c,'string'));
        den=str2sym(get(c1,'string'));
        dom=str2sym(get(c3,'string'));
        dom2=str2sym(get(c4,'string'));
        raices= solve(den);
        
        if w==1
           x=den-dom;
            y=-num/((-x)-dom);
            s=0;
            for k=1:10;
                s=s-dom^(k-1);
                res=string(s);
                set(c2,'string',res);
            end
        end
           
        if w==2
            m=1;
            if length(raices) == 1
                x=den-dom;
                f1=num/(dom-x);
                w=dom2/dom;
                s=0;
                for k=1:10;
                    s=s+((w^(k-1)))
                end
                s=(num/dom)*s;
                res=string(s);
                set(c2,'string',res);
            end

            if length(raices) > 1
                m=1;  
                for i=1:length(raices)
       
                if raices(i)~= -(dom-z)
                    cambiar(m,1)=z-raices(i);
                    m=m+1;
                end
                m=1;
                end
                m=1;  
                    for i=1:length(raices)
                        if raices(i)== -(dom-z)
                        bueno(m,1)=z-raices(i);
                         m=m+1;
                        end
                    end

            d=1;
            for i=1:length(bueno)
                d=d*bueno(i,1);
            end
            for i=1:length(cambiar)
                 vectordom(i,1)=dom;
            end
            m=1;
            for i=1:length(cambiar)
            x(m,1)=cambiar(i)-vectordom(i);
            m=m+1;
            end
            for i=1:length(x)
            d=d*(vectordom(i)+x(i));
            end
            f1=num/d;
            w=dom2/dom;
            s=0;
            for k=1:10;
                s=s+((w^(k-1)));
            end
            s=(num/dom^length(raices))*s;
            res=string(s);
            set(c2,'string',res);
            end
        end 
    end
    uicontrol('style','pushbutton','position',[400 230 140 40],'callback',@boton_2,'string','Limpiar','FontSize',13);  % Button to clean all
function boton_2(atr,tim)
    set(c,'string','');
    set(c1,'string','');
    set(c2,'string','');
    set(c3,'string','');
    set(c4,'string',''); 
    uicontrol('style','popupmenu','string',{'','<','>'},'position',[410 335 45 20],'FontSize',15,'callback',@popMenu); % To choose the function we are going to work
end
end
end


            
       
        
        
        
        
        
        
        
        
        
        
        
        
% % Para mayores
% syms z
% num=z+2
% den=z-3
% dom=z+2
% dom2=5
% raices= solve(den)
% m=1;
% if length(raices) == 1
%     x=den-dom;
% f1=num/(dom-x)
% w=dom2/dom
% s=0;
%     for k=1:10;
%     s=s+((w^(k-1)))
%     end
% s=(num/dom)*s
% end
% 
% if length(raices) > 1
%     m=1;  
%     for i=1:length(raices)
%        
%         if raices(i)~= -(dom-z)
%         cambiar(m,1)=z-raices(i);
%         m=m+1;
%         end
%         m=1;
%          
%        
% 
%     end
%      m=1;  
%     for i=1:length(raices)
%    if raices(i)== -(dom-z)
%         bueno(m,1)=z-raices(i);
%         m=m+1;
%    end
%     end
% 
% d=1;
% for i=1:length(bueno)
%     d=d*bueno(i,1)
% end
% for i=1:length(cambiar)
%     vectordom(i,1)=dom;
% end
% m=1;
% for i=1:length(cambiar)
%     x(m,1)=cambiar(i)-vectordom(i)
%     m=m+1;
% end
% for i=1:length(x)
%     d=d*(vectordom(i)+x(i))
% end
% f1=num/d;
% w=dom2/dom;
% s=0;
% for k=1:10;
%     s=s+((w^(k-1)))
%     end
% s=(num/dom^length(raices))*s
% end
%        end 
% 
% 
% 
% 
% 
% 
% % if length(raices) == 3
% %    m=1;  
% %     for i=1:length(raices)
% %        
% %         if raices(i)~= -(dom-z)
% %         cambiar(m,1)=z-raices(i);
% %         m=m+1;
% %         end
% %         m=1;
% %          
% %        
% % 
% %     end
% %      m=1;  
% %     for i=1:length(raices)
% %    if raices(i)== -(dom-z)
% %         bueno(m,1)=z-raices(i);
% %         m=m+1;
% %    end
% %     end
% %     
% %     
% % 
% % d=1;
% % for i=1:length(bueno)
% %     d=d*bueno(i,1)
% % end
% % for i=1:length(cambiar)
% %     vectordom(i,1)=dom;
% % end
% % m=1;
% % for i=1:length(cambiar)
% %     x(m,1)=cambiar(i)-vectordom(i)
% %     m=m+1;
% % end
% % for i=1:length(x)
% %     d=d*(vectordom(i)+x(i))
% % end
% % f1=num/d;
% % w=dom2/dom;
% % s=0;
% % for k=1:10;
% %     s=s+((w^(k-1)))
% %     end
% % s=(num/dom^length(raices))*s
% % end
% 
% 
% % Para menores que 1