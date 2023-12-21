z=x+1j*y
u=z^4-z^2+1
raices=solve(u);
m=1;
for i=1:length(raices)
    if imag(raices(i))>0
    vpolos(m,1)=raices(i);
    m=m+1;
    end
end
f1=1;
for i=1:length(raices)
    f1=f1*(z-raices(i));
end
r=0;
for i=1:length(vpolos)
r=r+subs(simplify((z-vpolos(i))/f1),z,vpolos(i))
end
integral=eval(2*pi*1i*r)