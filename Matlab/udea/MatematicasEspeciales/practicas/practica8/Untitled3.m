syms x n 
c=1;
L=2;
f1=sin(x);
f2=L-x;
F1=2/L*int(f1*sin(n*pi*x/L),x,[0 L]);
F2=2/L*int(f2*sin(n*pi*x/L),x,[L/2 L]);
F=F1;
t=0:0.1:20;
x1=0:L/50:L;
ss = {}
for i=1:length(t)
s=0;
ss(1,i)={subs(F*cos(n*pi*c*t(i)/L)*sin(n*pi*x/L),{x},{x1})};
end
for i=1:length(t)
s=0;
for k=1:5
s=s+eval(subs(ss(1,i),{n},{k}));
end 
plot(x1,s)
axis([-0.1 L+0.1 -L L])
pause(0.005)
end