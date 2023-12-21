syms n t 1
w0=2*pi/1;
intervalo=[0 1];
f=t;T=1;
a0=2/T*int(f,t,intervalo);
an=2/T*int(fi*cos(n*w0*t),t,intervalo);
bn=2/T*int(fi*sin(n*w0*t),t,intervalo);

s0=1/2*a0;
sn=an*cos(n*w0*t)+bn*sin(n*w0*t);
s=0;
t1=-1:2/100:1;
for k=1:50
    s=s+eval(subs(sn,{n t},{k t1}));
    s1=s+eval(s0);
plot(t1,s1)
pause(1)
end


