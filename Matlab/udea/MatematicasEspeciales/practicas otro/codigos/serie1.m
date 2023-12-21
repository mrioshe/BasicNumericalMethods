t=-2:2/100:2;% periodo T=2
s=0;

for k=1:50
    s=s+4/pi*1/(2*k-1)*sin((2*k-1)*pi*t);
    plot(t,s)
    pause(0.5)
end