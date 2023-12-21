t=sym("t");
n=sym("n");
ar={t+1,-t+1,0}
arintv={[-1 0],[0 1],[1 2]};
a1=arintv{1,1};
a2=arintv{1,length(arintv)};
T=a2(2)-a1(1);
w0=2*pi/T;
a0=0;an=0;bn=0;
for i=1:length(ar)
intervalo=arintv{1,i};
f=ar{1,i};
a0=a0+2/T*int(f,t,intervalo);
an=an+2/T*int(f*cos(n*w0*t),t,intervalo);
bn=bn+2/T*int(f*sin(n*w0*t),t,intervalo);
end
s0=1/2*a0;
sn=an*cos(n*w0*t)+bn*sin(n*w0*t);
s=0;
t1=-1:6/100:5;
for k=1:50
    s=s+eval(subs(sn,{n t},{k t1}));
    s1=s+eval(s0);
plot(t1,s1)
pause(0.1)
end