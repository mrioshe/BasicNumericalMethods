t=0:2*pi/20:2*pi;
r=0:10;
for i=1:length(r)
    x=r(i)*cos(t);
    y=r(i)*sin(t);
    M(1:2,1+length(t)*(i-1):length(t)*i)=[x;y];
end
plot(M(1,:),M(2,:),'o')
for j=1:length(r)-1
    for i=1:length(t)-1
        
        s=[i+length(t)*(j-1),...
            i+1+length(t)*(j-1),...
            i+length(t)+1+length(t)*(j-1),...
            i+length(t)+length(t)*(j-1)];
        fac(i+length(t)*(j-1),:)=s;
        for l=1:
        cont=(length(x)-1)*(j-1)+i
        patch('faces',s,...
            'vertices',M','facecolor',colorin3(cont),...
            'edgecolor',colorin3(cont))
        pause(0.05)
    end
end
