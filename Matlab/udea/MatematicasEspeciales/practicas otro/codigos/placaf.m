clear all;close all;clc

x=linspace(0,7,20);
y=linspace(0,7,20);
[X, Y]=meshgrid(x,y);
for i=length(x):-1:1
    for j=length(y):-1:1
        M(j+(i-1)*length(x),:)=[X(i,j) Y(i,j)];
    end
end
w=1;
axis([0 7 0 7])
hold on
syms x1 y1 n
minimos=[];
m=1:7;
while w==1
    resp=inputdlg(('Ingrese la posición correspondiente 1:arriba, 2:abajo, 3:derecha, 4:izquierda'));
    if resp == "1" || resp== "2" || resp== "3" || resp== "4"
        w=2;
        if resp== "1" || resp== "2"
            Fx=str2sym(inputdlg(strcat('Ingrese la función de x1')));
            Dn=2/(7*sinh(n*pi*7/7))*int(Fx*sin(n*pi*x1/7),x1,[0 7]);
            
            if resp== "1"
                for j=1:length(x)-1
                    %modulo=mod(j,2);
                    calores1=[];
                    for i=1:length(y)-1
                        calor1=0;
                        for k=1:length(m)
                            calor1=calor1+eval(subs(Dn,n,k))*sinh(k*pi*x(j)/7)*sin(k*pi*y(i)/7);
                        end
                        calores1(i)=calor1;
                    end
                    maximos(j)=max(abs(calores1));
                    minimos(j)=min(abs(calores1));
                end
            elseif resp== "2"
                for j=1:length(x)-1
                    % modulo=mod(j,2);
                    calores1=[];
                    for i=1:length(y)-1
                        calor1=0;
                        for k=1:length(m)
                            %de abajo hacia arriba
                            calor1=calor1+eval(subs(Dn,n,k))*sinh(k*pi*((7-x(j))/7))*sin(k*pi*((7-y(i))/7));
                        end
                        calores1(i)=calor1;
                    end
                    maximos(j)=max(abs(calores1));
                    minimos(j)=min(abs(calores1));
                end
            end
        elseif resp== "3" || resp== "4"
            Fy=str2sym(inputdlg(strcat('Ingrese la función de y1')));
            Dn=2/(7*sinh(n*pi*7/7))*int(Fy*sin(n*pi*y1/7),y1,[0 7]);
            
            if resp== "3"
                for j=1:length(x)-1
                    modulo=mod(j,2);
                    calores1=[];
                    for i=1:length(y)-1
                        calor1=0;
                        for k=1:length(m)
                            calor1=calor1+eval(subs(Dn,n,k))*sinh(k*pi*y(i)/7)*sin(k*pi*x(j)/7);
                        end
                        calores1(i)=calor1;
                    end
                    maximos(j)=max(abs(calores1));
                    minimos(j)=min(abs(calores1));
                end
            elseif resp== "4"
                for j=1:length(x)-1
                    modulo=mod(j,2);
                    calores1=[];
                    for i=1:length(y)-1
                        calor1=0;
                        for k=1:length(m)
                            
                            calor1=calor1+eval(subs(Dn,n,k))*sinh(k*pi*(7-y(i))/7)*sin(k*pi*(7-x(j))/7);
                        end
                        calores1(i)=calor1;
                    end
                    maximos(j)=max(abs(calores1));
                    minimos(j)=min(abs(calores1));
                end
            end
        end
    end
end
for j=1:length(x)-1
    modulo=mod(j,2);
    calores=[];
    for i=1:length(y)-1
        calor=0;
        for k=1:length(m)
            if resp == "3"
                calor=calor+eval(subs(Dn,n,k))*sinh(k*pi*y(i)/7)*sin(k*pi*x(j)/7);
            elseif resp == "1"
                calor=calor+eval(subs(Dn,n,k))*sinh(k*pi*x(j)/7)*sin(k*pi*y(i)/7);
            elseif resp == "2"
                calor=calor+eval(subs(Dn,n,k))*sinh(k*pi*((7-x(j))/7))*sin(k*pi*((7-y(i))/7));
                
            else
                calor=calor+eval(subs(Dn,n,k))*sinh(k*pi*(7-y(i))/7)*sin(k*pi*(7-x(j))/7);
            end
            
        end
        calores(i)=calor;
        if resp=="4"
            fac(i+(j-1)*(length(x)-1),:)=[((length(x)*j)-i),...
                ((length(x)*j)-(i-1)),((length(x)*j)-(i-1))+length(y),((length(x)*j)-i)+length(y)];
            
            % fac(i+(j-1)*(length(x)-1),:)=[i+(j-1)*length(x),...
            %    i+(j-1)*length(x)+1,...
            %   i+(j-1)*length(x)+length(y)+1,...
            %  i+length(y)+(j-1)*length(x)];
            % s=[length(x)*(j-1)+i,length(x)*(j-1)+i+1,length(x)*(j-1)+i+length(x)+1,length(x)*(j-1)+i+length(x)];
            %    cont=(length(x)-1)*(j-1)+i;
        else
            fac(i+(j-1)*(length(x)-1),:)=[i+(j-1)*length(x),...
                i+(j-1)*length(x)+1,...
                i+(j-1)*length(x)+length(y)+1,...
                i+length(y)+(j-1)*length(x)];
        end
        patch('faces',fac(i+(j-1)*(length(x)-1),:),'vertices',M,...
            'facecolor',colorin_placa(63/max(maximos)*abs(calor)),'edgecolor',colorin_placa(63/max(maximos)*abs(calor)))
        
        hold on
        pause(0.00000000000000000000003)
    end
    
    
end
