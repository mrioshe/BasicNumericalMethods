syms z
f=z^4-1;
v=solve(f);
p=z-1;
r=sqrt(2);
p1=solve(p);
m=1;
for k=1:length(v)
    q=eval(norm(p1-v(k)));
    if q<=r
        polo(m)=v(k);
        m=m+1;
    end
end