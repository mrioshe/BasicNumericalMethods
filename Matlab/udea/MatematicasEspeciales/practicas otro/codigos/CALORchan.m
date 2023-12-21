L=12;
x=0:L/100:L;
t=0:0.1:30;
s=0;
y=zeros(1,length(x));
y1=650*ones(1,length(x));
M=[x x;y y1];
f1=t;
f2=10-t;

syms n y
u1=y*((L-10)/L);
Bn1=eval((2/L)*int(u1*sin(n*pi*y/L),y,0,L));


for i=1:length(t)
    for k=1:20
        Bn=eval(subs(Bn1,n,k));
        s=s+(Bn*sin(k*pi*x/L)*exp(-k^2*pi^2*t(i)/L^2)+(((L-x)/L)*(t(i)))+((x/L)*(10-t(i))));
%         s=s+(Bn*sin(k*pi*x/L)*exp(-k^2*pi^2*t(i)/L^2));
        
    end

    m=max(s);


        for i=1:length(x)-1
            cuadro=[i i+1 i+length(x)+1 i+length(x)];
            patch('faces',cuadro,'vertices',M','facecolor',colorinchan(s(i+1)/m),'edgecolor',colorin3chan(s(i+1)/m));
        end
        hold on
        plot(x,s)
        axis([0 (L) 0 100])
        pause(0.025)
end

