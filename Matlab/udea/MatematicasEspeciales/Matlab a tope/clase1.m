syms x y z f u v
y=x^2-1;
z=x+j*y;
f=z^2;
u=real(f)
v=imag(f)
subplot(2,1,1)
ezplot(y)
x1=-6:12/100:6;
u1=eval(subs(u,x,x1));
v1=eval(subs(v,x,x1));
subplot(2,1,2)
plot(u1,v1)