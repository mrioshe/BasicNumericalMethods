function [RESPUESTA] = M(M_v1v2,ni,nt,D_ov1,D_v1v2,x_o)

D1=(ni/M_v1v2(1,2))*(1-M_v1v2(1,1));
D2=(nt/M_v1v2(1,2))*(1-M_v1v2(2,2));
P=-M_v1v2(1,2);
s1=D_ov1-D1;
s2=(((1/nt)*(-M_v1v2(1,2)-ni/s1)))^(-1);
D_v2i=s2+D2;
D_oi=D_v2i+D_v1v2;
m_x=-(ni/nt)*(s2/s1);
m_alpha=-(s1/s2);
f1=nt/P;
f2=ni/P;
F1=f1-D1;
F2=f2-D2;
x_i=m_x*x_o;

RESPUESTA=zeros(12,1);
RESPUESTA(1)=D1;
RESPUESTA(2)=D2;
RESPUESTA(3)=P;
RESPUESTA(4)=s1;
RESPUESTA(5)=s2;
RESPUESTA(6)=D_v2i;
RESPUESTA(7)=D_oi;
RESPUESTA(8)=m_x;
RESPUESTA(9)=m_alpha;
RESPUESTA(10)=f1;
RESPUESTA(11)=f2;
RESPUESTA(12)=F1;
RESPUESTA(13)=F2;
RESPUESTA(14)=x_i;

end
