syms w t
F=int(exp(-j*w*t),t,-1,1)
W=-4:20/100:4;
q=0;
[num,den]=numden(F);
d=solve(den);
for k=1:length(W)
    if W(1,k)==d
        q(1,k)=abs(subs(F,w,W(1,k)+0.01));
    else
    q(1,k)=abs(subs(F,w,W(1,k)));
    end
end
ancho=20/100;
area=0;
for k=1:length(W)
    area=area+ancho*q(1,k);
end
disp(area)