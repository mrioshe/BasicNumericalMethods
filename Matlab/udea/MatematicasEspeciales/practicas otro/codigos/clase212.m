x=linspace(0,2,101);
t=linspace(0,5,200);
u=0
figure

for j=1:length(t)
for k=1:30
u=u-8*(-1)^k/((2*k-1)^2*pi^2)*cos((2*k-1)*pi/2*t(j))*sin((2*k-1)*pi/2*x);
end
plot(x,u)
axis([0 2 -25 25])
pause(0.2)
end