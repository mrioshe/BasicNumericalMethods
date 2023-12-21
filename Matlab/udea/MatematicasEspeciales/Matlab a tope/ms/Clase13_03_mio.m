% t= -40*pi:80*pi/500:40*pi;
% f=sin(t/5)+cos(t/4);
% plot(t,f)
% 
% 
% %____
% s=0;
% t=-1/2:1/200:1/2;
% for k=1:50
%    s=s+4/pi*1/(2*k-1)*sin((2*k-1)*2*pi*t);
%    plot(t,s)
%    pause(0.5)
% end


s=0;
t=-pi:2*pi/100:pi;
for k=1:100
s=s+8/pi^2*1/(2*k-1)^2*cos((2*k-1)*t); %w0=2*pi/2*pi =1 de donde T=2*pi
end
pause(1)
plot(t,s)