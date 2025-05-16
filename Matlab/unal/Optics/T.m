function [RESPUESTA] = T(D,n)

RESPUESTA=zeros(2);
RESPUESTA(1,1)=1;
RESPUESTA(2,2)=1;
RESPUESTA(2,1)=D/n;

syms D;
syms n;
S1=[sym(RESPUESTA(1,1)) sym(RESPUESTA(1,2)); D/n sym(RESPUESTA(2,2))];
latex(S1)
S2=[sym(RESPUESTA(1,1)) sym(RESPUESTA(1,2)); sym(RESPUESTA(2,1)) sym(RESPUESTA(2,2))];
latex(S2)
end
