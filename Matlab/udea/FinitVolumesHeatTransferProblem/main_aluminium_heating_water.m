clear all
%Constantes del problema:

    %Parámetros geometricos:
    t=0.2;
    Deltax=t/4;
    Deltay=t/4;
    Deltaw=Deltay;

    % conductividades [W/(m-C)]
    k=zeros(3,1);
    k(1,1)=51;  % Acero
    k(2,1)=398; % Cobre
    k(3,1)=205; % Aluminio

    % Densidades [kg/m^3]
    rho=zeros(3,1);
    rho(1,1)=7870;  % Acero
    rho(2,1)=8960;  % Cobre
    rho(3,1)=2700;  % Aluminio

    % Calores especificos [J/kg-C]
    c_p=zeros(3,1);
    c_p(1,1)=465;  % Acero
    c_p(2,1)=385;  % Cobre
    c_p(3,1)=897;  % Aluminio

    % Absortividades [m^2/s]
    alpha=k./(rho.*c_p);

    %Coeficiente de convección [W/m^2-C]
    h=1000;

    %Tempeartura alr
    T_inf=110;

%Generamos tabla con taos maximos para cada tipo de nodo y tiempos máximos:
    
    tao_max=zeros(15,1,3);    %Numero de ecuaciones=15 y son 3 tipos de materiales.
    Deltat_max=zeros(15,1,3); %[s]

    %Nodo A:
    tao_max(1,1,:)=1/4;
    
    %Nodos B:
    for m=1:3
        tao_max(2,1,m)=(1/((2*h*Deltaw)/k(m,1)+4));
    end

    %Nodos C:

    for m=1:3
        tao_max(3,1,m)=(1/((2*h*Deltaw)/k(m,1)+4));
    end

    %Nodos D:

    for m=1:3
        tao_max(4,1,m)=(1/((2*h*Deltaw)/k(m,1)+4));
    end

    %Nodos E:

    for m=1:3
        tao_max(5,1,m)=(1/((2*h*Deltaw)/k(m,1)+4));
    end

    %Nodos F:

    for m=1:3
        tao_max(6,1,m)=(1/((4*h*Deltaw)/k(m,1)+4));
    end

    %Nodos G:

    for m=1:3
        tao_max(7,1,m)=(1/((4*h*Deltaw)/k(m,1)+4));
    end

    %Nodos H:

    for m=1:3
        tao_max(8,1,m)=(1/((4*h*Deltaw)/k(m,1)+4));
    end

     %Nodos I:

    for m=1:3
        tao_max(9,1,m)=(1/((4*h*Deltaw)/k(m,1)+4));
    end

    %Nodos J:

    for m=1:3
        tao_max(10,1,m)=(1/((4*h*Deltaw)/(3*k(m,1))+4));
    end

    %Nodos K:

    for m=1:3
        tao_max(11,1,m)=(1/((4*h*Deltaw)/(3*k(m,1))+4));
    end

    %Nodos L:

    for m=1:3
        tao_max(12,1,m)=(1/((4*h*Deltaw)/(3*k(m,1))+4));
    end

    %Nodos M:

    for m=1:3
        tao_max(13,1,m)=(1/((4*h*Deltaw)/(3*k(m,1))+4));
    end

    %Nodos N:

    for m=1:3
        tao_max(14,1,:)=1/4;
    end

    %Nodo o:

    for m=1:3
        tao_max(15,1,m)=(1/((2*h*Deltaw)/(k(m,1))+4));
    end

    %Nodo p:

    for m=1:3
        tao_max(16,1,m)=(1/((2*h*Deltaw)/(k(m,1))+4));
    end

    %Hallamos tiempos m para cada caso

    for m=1:16
        for n=1:3
             Deltat_min(m,1,n)=((Deltaw^2)*tao_max(m,1,n))/(alpha(n,1));
        end
    end


 % Hallamos el tiempo mínimo que se pueda usar para cada material truncando
 % el valor por debajo para que quede entero (y un poco menor del valor máximo)
    
    Deltat=zeros(3,1);

    for m=1:3
        Deltat(m,1)=min(floor(Deltat_min(:,1,m)));
    end

    %Obtenemos pasos mínimos para el acero de 32s, para el cobre de 4
    %s, y para el aluminio de 5s
   
 % Recalculamos los taos para cada tipo de ecuaciones según el tiempo
 % mínimo obtenido anteriomente

    tao=(1/(Deltaw^2))*(alpha.*Deltat);

 % Generamos matriz de NODOS: según la distribución nodal planteada se
 % tiene una matriz de 45*37 para un totoal de 1665 nodos. 
 % EN ESTE SCRIPT SOLO SOLUCIONAMOS PARA EL ACERO
 
 T=ones(45,37,1);
 T=110.*T; % Se llenan los nodos, con una temperatura igual al de los gases

    % CONDICION INICIAL:

    for m=1:45
        for n=33:37
            T(m,n,1)=15;
        end
    end

    for m=9:13
        for n=21:32
            T(m,n,1)=15;
        end
    end

    for m=21:25
        for n=21:32
            T(m,n,1)=15;
        end
    end

    for m=1:45
        for n=19:21
            T(m,n,1)=15;
        end
    end

    %Condición de simetría:

    for m=1:45
        for n=1:19
            T(m,n,1)=T(-m+46,-n+38,1);
        end
    end

% Crear un mallado con colores (para los nodos, no es fiel al tamaño real 
% los elementos, esta malla considera que todos los elementos tiene el mis
% tamaño lo cual es falso (no para los cálculo pero sí para la 
% representación gráfica))

    figure;

    %Corregimos tamaño de la matriz:
        l=T(:,:,1);
        for m=45:45
             for n=1:37
                 l(m+1,n+1)=l(m,n);
             end
         end

            for m=1:45
                for n=37:37
                    l(m,n)=1;
                end
            end

    pcolor(l(:,:,1)');
    %shading interp;  % Interpolación para suavizar los colores

    % Definir una escala de colores personalizada 
    colormap(jet);  % Utilizamos el mapa de colores "jet" 

    % Agregar una barra de colores
    colorbar;

    % Etiquetas y título del gráfico
    xlabel('Posición en X');
    ylabel('Posición en Y');
    title('Distribución de Temperaturas');
   
    %  ajustar los ejes si es necesario
    %axis([0, 46, 0, 38]);
    

 % COMENZAMOS A SOLUCIONAR: se debe programar cada ecuación cada iteración
 % del while, el criterio de parada se definirá proximamente:

   ts=2; %  time steep (paso temporal)

   % Se itera hasta alcanzar estado estable:
   prom_residuals=1;
   counter=0;
   while(prom_residuals>10^(-2))

   %Nodos A:


    T(:,:,ts)=T(:,:,ts-1);

   for m=2:44
       for n=34:36
           T(m,n,ts)=T(m,n,ts-1)*(1-4*tao(3))+tao(3)*(T(m-1,n,ts-1)+T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1));
       end
   end

   for m=10:12
       for n=21:33
           T(m,n,ts)=T(m,n,ts-1)*(1-4*tao(3))+tao(3)*(T(m-1,n,ts-1)+T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1));
       end
   end

   for m=22:24
       for n=21:33
           T(m,n,ts)=T(m,n,ts-1)*(1-4*tao(3))+tao(3)*(T(m-1,n,ts-1)+T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1));
       end
   end

   for m=2:44
       for n=20:20
           T(m,n,ts)=T(m,n,ts-1)*(1-4*tao(3))+tao(3)*(T(m-1,n,ts-1)+T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1));
       end
   end

   %Nodos B:
    
   for m=1:1
       for n=20:20
          T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
           
       end
   end

   for m=1:1
       for n=34:36
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=9:9
       for n=22:32
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=21:21
       for n=22:32
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m+1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end
    
   %Nodos C:

   for m=13:13
       for n=22:32
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=25:25
       for n=22:32
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=45:45
       for n=20:20
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=45:45
       for n=34:36
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos D:

   for m=2:44
       for n=37:37
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n-1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=2:8
       for n=21:21
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n-1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=14:20
       for n=21:21
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n-1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=26:44
       for n=21:21
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n-1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos E

   for m=2:8
       for n=33:33
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n+1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=14:20
       for n=33:33
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n+1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=26:44
       for n=33:33
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n+1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos F

   for m=1:1
       for n=37:37
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((4*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n-1,ts-1)+2*T(m+1,n,ts-1)+(4*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=1:1
       for n=21:21
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((4*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n-1,ts-1)+2*T(m+1,n,ts-1)+(4*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos G

   for m=1:1
       for n=33:33
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((4*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m,n+1,ts-1)+2*T(m+1,n,ts-1)+(4*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos H

   for m=45:45
       for n=37:37
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((4*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+2*T(m,n-1,ts-1)+(4*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=45:45
       for n=21:21
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((4*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+2*T(m,n-1,ts-1)+(4*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos I

   for m=45:45
       for n=33:33
           T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((4*h*Deltaw)/k(1))+4))+tao(3)*(2*T(m-1,n,ts-1)+2*T(m,n+1,ts-1)+(4*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos J

   for m=9:9
       for n=33:33
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(T(m-1,n,ts-1)+2*T(m+1,n,ts-1)+T(m,n-1,ts-1)+2*T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end


   for m=21:21
       for n=33:33
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(T(m-1,n,ts-1)+2*T(m+1,n,ts-1)+T(m,n-1,ts-1)+2*T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end
    
    %Nodos K
  

   for m=13:13
       for n=33:33
             T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(2*T(m-1,n,ts-1)+T(m+1,n,ts-1)+T(m,n-1,ts-1)+2*T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=25:25
       for n=33:33
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(2*T(m-1,n,ts-1)+T(m+1,n,ts-1)+T(m,n-1,ts-1)+2*T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

    %Nodos L

   for m=9:9
       for n=21:21
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(T(m-1,n,ts-1)+2*T(m+1,n,ts-1)+2*T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=21:21
       for n=21:21
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(T(m-1,n,ts-1)+2*T(m+1,n,ts-1)+2*T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos M

   for m=13:13
       for n=21:21
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(2*T(m-1,n,ts-1)+T(m+1,n,ts-1)+2*T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   for m=25:25
       for n=21:21
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(4)*(((h*Deltaw)/(3*k(1)))+1))+tao(3)*(2/3)*(2*T(m-1,n,ts-1)+T(m+1,n,ts-1)+2*T(m,n-1,ts-1)+T(m,n+1,ts-1)+(2*h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodos N

   for m=2:44
       for n=19:19
           T(m,n,ts)=T(m,n,ts-1)*(1-4*tao(3))+tao(3)*(2*T(m,n+1,ts-1)+T(m-1,n,ts-1)+T(m+1,n,ts-1));
       end
   end

   %Nodo O

   for m=1:1
       for n=19:19
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*2*(T(m,n+1,ts-1)+T(m+1,n,ts-1)+(h*Deltaw/k(1))*T_inf);
       end
   end

   %Nodo P

   for m=45:45
       for n=19:19
            T(m,n,ts)=T(m,n,ts-1)*(1-tao(3)*(((2*h*Deltaw)/k(1))+4))+tao(3)*2*(T(m-1,n,ts-1)+T(m,n+1,ts-1)+(h*Deltaw/k(1))*T_inf);
       end
   end

   %Condición de simetría:

    for m=1:45
        for n=1:19
            T(m,n,ts)=T(-m+46,-n+38,ts);
        end
    end

    for m=45:45
        for n=1:37
            l(m+1,n+1,ts)=1;
        end
    end

    for m=1:45
        for n=37:37
            l(m+1,n+1,1)=1;
        end
    end

    l=T(:,:,ts);

    for m=45:45
          for n=1:37
               l(m+1,n+1)=l(m,n);
          end
    end

    for m=1:45
          for n=37:37
               l(m+1,n+1)=l(m,n);
          end
    end

    residuals=abs(T(:,:,ts)-T(:,:,ts-1));
    prom_residuals=mean(residuals,"all");
    
    pcolor(l');
    % Definir una escala de colores personalizada 
    colormap(jet);  % Utilizamos el mapa de colores "jet" 

    % Agregar una barra de colores
    colorbar;

    % Etiquetas y título del gráfico
    xlabel('Posición en X');
    ylabel('Posición en Y');
    title('Distribución de Temperaturas');
    hold on
    pause(0.01)
   
    if(T(23,19,ts)>=100 && counter==0)
        ts_crit=ts;
        counter=1;
    end

    ts=ts+1;
    T_prom(ts)=mean(T(:,:),"all");
    time(ts)=ts*Deltat(3,1);
    
   end

   figure
   plot(time,T_prom);
   yline(110,'-');
   xlabel('Tiempo [s]');
   ylabel('Temperatura promedio[C] ');
   title('Temperatura promedio vs tiempo (aluminio en agua)');