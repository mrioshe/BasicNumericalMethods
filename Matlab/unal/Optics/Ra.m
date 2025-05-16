function [RESPUESTA] = Ra(nt,ni,R)

RESPUESTA=zeros(2);
RESPUESTA(1,1)=1;
RESPUESTA(2,2)=1;
RESPUESTA(1,2)=-(nt-ni)/R;

syms nt;
syms ni;
syms R;
S1=[sym(RESPUESTA(1,1)) -((nt-ni)/R); sym(RESPUESTA(2,1)) sym(RESPUESTA(2,2))];
latex(S1)
S2=[sym(RESPUESTA(1,1)) sym(RESPUESTA(1,2)); sym(RESPUESTA(2,1)) sym(RESPUESTA(2,2))];
latex(S2)
end

