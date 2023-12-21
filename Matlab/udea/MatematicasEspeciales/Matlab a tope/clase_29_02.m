syms z
f=(z^3+5*z-1)/(z^4-1); % Tengo que extraer lo que esta en el denominador
r=solve(z^4-1)
%Evalua radios
for i=1:length(r)
    % if d<r
    
    % while true
    disp('es polo')
    polos(i,1)=r(i)
end

s=0;
f1=(z^3+5*z-1)/((z+1)*(z-1)*(z+1i)*(z-1i))*(z-polos(3))
simplify(f1)
eval(subs(simplify(f1),z,polos(3)))
