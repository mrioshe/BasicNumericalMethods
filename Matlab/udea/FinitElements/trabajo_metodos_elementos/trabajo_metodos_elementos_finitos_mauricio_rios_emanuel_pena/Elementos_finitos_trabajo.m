function Elementos_finitos_trabajo 
clear all
close all
clc

syms x xi xii y d_Ter1 d_Ter2 d_Ter3  %%% lista de las variables simólicas en el espacio de trabajo


% Ingresar las funciones de forma para la utilización de la FEA.

hi=xii-xi;
H1=(xii-x)/hi;
H2 = (x-xi)/hi;

% Ingresar los vectores de la función de peso y la función de prueba
W=[H1;H2]; % Ingrese la función de peso como un vector columna (2,1)
dW=diff(W,x); % Diferencial  como vector columna de la función W con respecto a x
Y=[H1 H2]; % Ingrese la función de peso como un vector fila (2,1)
dY=diff(Y,x); % Diferencial  como vector fila de la función W con respecto a x

% Condiciones geométrica del dominio
n=2; % Número de divisiones del dominio, este se variará para ver la influencia de este parámetro
a=1; % Límite inferior del dominio
b=6;   % Límite superior del dominio
hi=(b-a)/n; % Tamaño de la división

%%% Ingresamos cada término de la ecuación diferencial a analizar por
%%% elementos finitos

Ter1=-2*x^2*dW*dY; % Definimos ter1, según ecuación vectorial
d_Ter1=int(Ter1,x,xi,xii); % integramos ter1, en terminos genericos (simbólicos) xi y xii
Ter2=-3*x*W*dY; % Definimos ter2, según ecuación vectorial
d_Ter2=int(Ter2,x,xi,xii);% integramos ter2, en terminos genericos (simbólicos) xi y xii
Ter3=-3*W*Y;  % Definimos ter3, según ecuación vectorial
d_Ter3=int(Ter3,x,xi,xii); % integramos ter2, en terminos genericos (simbólicos) xi y xii
TerSum= d_Ter1+d_Ter2+d_Ter3; % Suma los términos que dependen de yi, yi+1 (izquierda de la ecuación vectorial)

%%% Inicializamos la matriz de rigidez y el vector con valore de cero

K=zeros(n+1); % Matriz de rigidez cuadrada de tamaño (n+1,n+1)
F=zeros(n+1,1); % Vector de tamaño (n+1,1);

% Inicializamos los valores inicial y final del elemento 
xi=a; % xi debe iniciar en el límite menor de y
xii=hi+a; % xii debe ser xi más el paso

% Ensamble de la matriz de rigídez, 'n' es el número de elementos

for i=1:1:n
    K1=eval(TerSum); % Ponemos la suma de terminos, en función de xi,xii para una iteación i 
    
    %%% Ingresar los valores de la matriz de cada elemento a la matriz
    %%% global de rígidez
    
    K(i,i)=K(i,i)+K1(1,1);
    K(i,i+1)=K(i,i+1)+K1(1,2);
    K(i+1,i)=K(i+1,i)+K1(2,1);
    K(i+1,i+1)=K(i+1,i+1)+K1(2,2);
     
    xi=xi+hi; % Cambiamos le valor de xi, sumando a este el valor del paso hi
    xii=xii+hi; % Cambiamos le valor de xii, sumando a este el valor del paso hi
end 
   
    %%% Ingrese las condiciones de frontera en la matriz global de rigidez
    K(1,:)=zeros(n+1,1); % llenamos la primera fila de la matriz de rigidez K de ceros
    K(1,1)=1; % Llevamos uno a el valor a_11, para al despejar el vector columna X se respete las condiciones de frontera
    
    K(n+1,:)=zeros(n+1,1);% llenamos la primera fila de la matriz de rigidez K de ceros
    K(n+1,n+1)=1;%%% Llevamos uno a el valor a_(n+1),(n+1),para al despejar
                 % el vector columna x se respete las condiciones de frontera
    
    F(1,1)=5; % Llevamos y(a) al vector columna F para que al despejar se respete las primera condición de frontera
    F(n+1,1)=5; %Llevamos y(b) al vector columna F para que al despejar se respete las primera condición de frontera
    
Sol=inv(K)*F; % Se obtiene la solución despejando X (valores de y(x)) del sistema KX=F

GG=xlsread('ecuaciones_diferenciales.xlsx','B1:C50002'); % Se lee solución analítica(que se toma como exacta)
ee=linspace(a,b,n+1); % Se genera vector de valor en x para graficar y(x) vs x

%Grafi=subs(GG,x,xx);
plot(ee,Sol,'r',GG(:,1),GG(:,2),'b') % Graficamos la solución analítica y la solución obtenida por el método de elementos
grid on

end