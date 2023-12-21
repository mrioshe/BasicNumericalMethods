s=0;
t=-5:1/1000:5;
for k=1:1000
s=s+4/pi*1/(2*k-1)*sin((2*k-1)*2*pi*t);
end
%pause(0.1)
plot(t,s)
