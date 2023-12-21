syms n t 1
w0=2*pi/1;
f=t; T=1;
a0=0;
a0= a0+2/T*int(fi,t,0,1);
an=a0+2/T*int(fi*cos(n*w0*t),t);
bn=2/T*int(fi*sin(n*w0*t),t);
ann=subs(an,t,1)-subs(an,t,0);
bnn=subs(bn,t,1)-subs(bn,t,0);
s0=1/2*a0
sn=ann*cos(n*w0*t)+ bnn*sin(n*w0*t);
s=0;
t1=-1:2/100:1;
for k=1:50
    s=s+ eval(subs(sn,{n t},{k t1}));
    s1=s+eval(s0);
     plot(t1,s1)
     pause(1) 
end
