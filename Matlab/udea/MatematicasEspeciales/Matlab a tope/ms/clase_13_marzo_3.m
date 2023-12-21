s=0;
t=-2*pi:2*pi/100:2*pi;
for k=1:100
s=s+8/pi^2*1/(2*k-1)^2*cos((2*k-1)*t);
pause(2)
plot(t,s)
end