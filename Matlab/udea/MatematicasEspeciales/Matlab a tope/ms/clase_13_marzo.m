syms z f
%f=z^2+2*z+2;
f=z^4-1
v=solve(f)
n=1;
f1=1;
for k=1:length(v)
    f1=f1*(z-v(k));
    q=eval(imag(v(k)-real(v(k))));
    if eval(imag(v(k)))>0 || q==0;
    s(n)=v(k);
    n=n+1;
    end
end
sr=0;
q=0;
for k=1:length(s)
    q=q+subs((z-s(k))/f1,z,s(k));
end
in=2*pi*1i*q











