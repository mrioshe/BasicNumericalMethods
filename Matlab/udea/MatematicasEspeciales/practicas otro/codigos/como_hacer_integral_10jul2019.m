%Variables simbolicas
syms x y
%Funcion
f=x^2+y^2
%Integral con respecto a x como variable
h=int(f,x)
%Sustituir x por 1 y y por 2
subs(h,[x ,y],[1,2])
%Integrar con respecto a y
%int(f,y)
%Integral definida
%int(f,2,3)
%Integral con respecto a x definida (las dos variables)
%int(f,x(x,y),([1 2],[2 3]))