 

syms x y z t
z=x+j*y;%esto convierte a z como variable que depende de x e y
f=cos(z);
u=real(f);
v=imag(f);
for k=1:length(b)
u1(1,k)=eval(subs(u,[x y],[a(k) b(k)]));
v1(1,k)=eval(subs(v,[x y],[a(k) b(k)]));
u2(1,k)=eval(subs(u,[x y],[a1(k) b1(k)])) ;
v2(1,k)=eval((subs(v,[x y],[a1(k) b1(k)])));
end
subplot(2,1,2)
plot(u1,v1,'r')
hold on
plot(u2,v2,'m')


