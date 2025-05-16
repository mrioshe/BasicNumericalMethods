function [RESPUESTA] = Lg(nt,ni,nl,Dl,R1,R2)

Pv1=(nl-ni)/R1;
Pv2=(nt-nl)/R2;
RESPUESTA=zeros(2);
RESPUESTA(1,1)=1-(Pv2*Dl/nl);
RESPUESTA(2,2)=1-(Pv1*Dl/nl);
RESPUESTA(2,1)=Dl/nl;
RESPUESTA(1,2)=-Pv1-Pv2+(Pv1*Pv2*Dl/nl);

syms Dl;
syms nl;
syms Pv1;
syms Pv2;
S1=[1-(Pv2*Dl/nl) -Pv1-Pv2+(Pv1*Pv2*Dl/nl); Dl/nl 1-(Pv1*Dl/nl)];
latex(S1)
S2=[sym(RESPUESTA(1,1)) sym(RESPUESTA(1,2)); sym(RESPUESTA(2,1)) sym(RESPUESTA(2,2))];
latex(S2)
end


