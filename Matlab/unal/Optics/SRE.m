function [RESPUESTA] = SRE(D01,ni,nt,R)
%SRE Summary of this function goes here
% SE CONSIDERA nt>ni, si es el caso contrario, todo se multiplica por -1
%   Detailed explanation goes here

D12=((1/nt)*((nt-ni)/R-ni/D01))^(-1);

if R>0
    ft = (R*nt/(nt-ni));
    fi = (R*ni/(nt-ni));
end

if R<0
    ft = (-abs(R)*nt/(nt-ni));
    fi = (-abs(R)*ni/(nt-ni));
end

m_a=-(D01/D12);
m_x=-(ni/nt)*(D12/D01);

RESPUESTA=[D12,ft,fi,m_x,m_a];

end

