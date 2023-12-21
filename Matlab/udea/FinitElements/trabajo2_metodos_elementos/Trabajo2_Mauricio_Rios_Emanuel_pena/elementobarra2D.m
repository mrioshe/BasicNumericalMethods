function elementobarra2D
clc
clear all
close all

% Cargamos los archivos y tomamos la longitud de los vectores y/o matrices:
coord=load('coordenadas.txt');
cantcoord=size(coord,1);
conect=load('conectividad.txt');
cantconect=size(conect,1);
proper=load('propiedades.txt');

fuerza=load('fuerzas.txt');
fronte = load('fronteras.txt');
cantfront=size(fronte,1);

% Generamos matriz cuadrada de orden del numero de nodos por 2 (en este caso hay 11 nodos, entonces se tiene una matriz 22*22)
kglobal=zeros(cantcoord*2);

% Definimos el módulo de elasticidad del acero
E=200000000000;

for p=1:1:cantconect
    
    % Extraemos el nodo i (y sus coordenadas) y el nodo j(y sus coordenadas) del elemento p
    i=conect(p,2);
    j=conect(p,3);
    nodo_i=[coord(i,2),coord(i,3)];
    nodo_j=[coord(j,2),coord(j,3)];
    
    % Calculamos la longitud del elemento p
    le=norm(nodo_j-nodo_i);
    
    % extraemos el área del elemento p
    A=proper(p,2);
    
    % Se definen las entradas del l y m
    l=(nodo_j(1)-nodo_i(1))/le;
    m=(nodo_j(2)-nodo_i(2))/le;
    k=[l^2 l*m;l*m m^2];
    
    % Se define la matriz local
    
    klocal=((A*E)/le)*[k -k;-k k];

    % Se definen posicionamientos genéricos de la matriz global
    d=i*2-1;
    e=i*2;
    f=j*2-1;
    g=j*2;
    
    % Se ingresan datos en la matriz global dependiendo de los posicionamientos anteriomente asignados
    
    kglobal(d,d)=kglobal(d,d)+klocal(1,1);
    kglobal(e,d)=kglobal(e,d)+klocal(2,1);
    kglobal(d,e)=kglobal(d,e)+klocal(1,2);
    kglobal(e,e)=kglobal(e,e)+klocal(2,2);
    
    kglobal(d,f)=kglobal(d,f)+klocal(1,3);
    kglobal(e,f)=kglobal(e,f)+klocal(2,3);
    kglobal(d,g)=kglobal(d,g)+klocal(1,4);
    kglobal(e,g)=kglobal(e,g)+klocal(2,4);
    
    kglobal(f,d)=kglobal(f,d)+klocal(3,1);
    kglobal(g,d)=kglobal(g,d)+klocal(4,1);
    kglobal(f,e)=kglobal(f,e)+klocal(3,2);
    kglobal(g,e)=kglobal(g,e)+klocal(4,2);
    
    kglobal(f,f)=kglobal(f,f)+klocal(3,3);
    kglobal(g,f)=kglobal(g,f)+klocal(4,3);
    kglobal(f,g)=kglobal(f,g)+klocal(3,4);
    kglobal(g,g)=kglobal(g,g)+klocal(4,4);

end

% Se define una constanste c grande para utilizar el enfoque de
% compensación
c=90000000000000;

% se genera el vector fuerza.
fglobal=fuerza(:,2);

% Se modifica el vector fuerza global y la matriz de rigidez global usando(devido al enfoque de compensación)

for h=1:1:cantfront
    
    if fronte(h,2)~= 10000
        kglobal(fronte(h,1)*2-1,fronte(h,1)*2-1)=kglobal(fronte(h,1)*2-1,fronte(h,1)*2-1)+c;
        fglobal(fronte(h,1)*2-1,1)=fglobal(fronte(h,1)*2-1)+c*fronte(h,2);
    end
    
    if fronte(h,3)~= 10000
        kglobal(fronte(h,1)*2,fronte(h,1)*2)= kglobal(fronte(h,1)*2,fronte(h,1)*2)+c;
        fglobal(fronte(h,1)*2,1)=fglobal(fronte(h,1)*2,1)+c*fronte(h,3);
    end
 
end

% se enseñan las matrices y vectores principales:
kglobal
fglobal
u=inv(kglobal)*fglobal

end