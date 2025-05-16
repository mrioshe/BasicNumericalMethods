function [RESPUESTA] = Re(ni,R)

RESPUESTA=zeros(2);
RESPUESTA(1,1)=1;
RESPUESTA(2,2)=1;
RESPUESTA(1,2)=2*ni/R;

syms ni;
syms R;
S1=[sym(RESPUESTA(1,1)) (2*ni/R); sym(RESPUESTA(2,1)) sym(RESPUESTA(2,2))];
latex(S1)
S2=[sym(RESPUESTA(1,1)) sym(RESPUESTA(1,2)); sym(RESPUESTA(2,1)) sym(RESPUESTA(2,2))];
latex(S2)
end

