x=0:10/200:10;L=10;c=1;s=0;
t=0:1/20:20;
y=zeros(1,length(x));
y1=ones(1,length(x));
M=[x x;y y1];
%plot(M(1,:),M(2,:),'o');
for i=1:length(x)-1
fac(i,:)=[i,i+1,i+length(x)+1,i+length(x)];
end
%patch('faces',fac,'vertices',M','facecolor',[1 0 0])

for j=1:length(t)
    for n=1:20
        s=s+2*L/(pi*n)*(-1)^(n-1)*sin(n*pi*x/L)*exp(-c^2*n^2*pi^2*t(j)/L^2);
    end
    for k1=length(x)-1
        cuadro=[i,i+1,i+length(x)+1,i+length(x)];
    
        patch('faces',cuadro,'vertices',M','facecolor',colorin2(s(i),length(x)))
    end
    

    axis([0 10 -10 1150]);
    pause(0.05);
end 