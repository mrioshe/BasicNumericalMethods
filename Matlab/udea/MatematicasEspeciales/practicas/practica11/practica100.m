clc; clear all;
syms r n 
t=0:2*pi/150:2*pi;
r=0:20;
for i=1:length(r)
    x=r(i)*cos(t);y=r(i)*sin(t);
    M(1:2,1+length(t)*(i-1):length(t)*i)=[x;y];
end
P=(length(M(1,:))-1)*(M(2,:)-1); plot(M(1,:),M(2,:))
c=0;
for j=1:length(r)-1
    for n=1:10
        c=c+(2*(-1)^n+1)/n*sin(n*t)*(r(j)/20)^n;
    end
    
    for k=1:length(t)-1 
        s=[k+length(t)*(j-1),k+1+length(t)*(j-1),k+length(t)+1+length(t)*(j-1),k+length(t)+length(t)*(j-1)]; fac(k+length(t)*(j-1),:)=s;
        patch ('faces',s,'vertices',M','facecolor',colorin_circular((c(k+1))/16),'edgecolor',colorin_circular((c(k+1))/16))
    end 
end



