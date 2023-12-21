x=0:2000/2000:2000;
t=0:10/100:10;
u=0;
y=zeros(1,length(x));
y1=650*ones(1,length(x));
M=[x x;y y1];
% for i=1:length(x)-1
% fac(i,:)=[i i+1 i+length(x)+1 i+length(x)];
% end
% plot(M(1,:),M(2,:),'o')
% patch('faces',fac,'vertices',M')

syms y k 
m=(2/20)*int((y*(20-10)/20)*sin(((k*pi)*y)/20),y,0,20);% Bn


for j=1:length(t)
for n=1:20
u=u+eval(subs(m,k,n))*sin(n*pi*x/10)*exp(-n^2*pi^2*t(j)/20^2)+(3-x)/3*t(j)+x/20*(10-t(j));
end
for i=1:length(x)-1
    cuadro=[i i+1 i+length(x)+1 i+length(x)];
    patch('faces',cuadro,...
        'vertices',M',...
        'facecolor',colorin3((u(i+1)/165.55)),...
        'edgecolor',colorin3((u(i+1)/165.55)));
end
hold on
plot(x,u)
axis([0 2000 0 650])
pause(0.001)
end