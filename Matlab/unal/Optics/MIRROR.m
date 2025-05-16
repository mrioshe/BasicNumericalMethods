function [RESPUESTA] = MIRROR(D01,R)
%SRE Summary of this function goes here
% SE CONSIDERA nt>ni, si es el caso contrario, todo se multiplica por -1
%   Detailed explanation goes here

D12=(-(2/R)-1/D01)^(-1);

f=-(R/2);

m_a=-(D01/D12);
m_x=-(D12/D01);

RESPUESTA=[D12,f,m_x,m_a];


end

