t=0:2*pi/20:2*pi;
R=10;
r=0:10/100:R;
for i=1:length(r)
    x=r(i)*cos(t);
    y=r(i)*sin(t);
    M(1:2,1+length(t)*(i-1):length(t)*i)=[x;y];
end
cont=0;
plot(M(1,:),M(2,:),'o')
for j=1:length(r)-1
    for i=1:length(t)-1
          if j==2 
          s=[length(t)*(j-1)+(length(t)-i),length(t)*(j-1)+(length(t)-i)+1,...
              length(t)*(j-1)+(length(t)-i)+length(t)+1,length(t)*(j-1)+(length(t)-i)+length(t)]  
          elseif j==4 
          s=[length(t)*(j-1)+(length(t)-i),length(t)*(j-1)+(length(t)-i)+1,...
              length(t)*(j-1)+(length(t)-i)+length(t)+1,length(t)*(j-1)+(length(t)-i)+length(t)]  
          else
        s=[i+length(t)*(j-1),...
            i+1+length(t)*(j-1),...
            i+length(t)+1+length(t)*(j-1),...
            i+length(t)+length(t)*(j-1)];
          end
        fac(i+length(t)*(j-1),:)=s;
        for n=1:30
            
        cont=cont+2*(-1)^(n+1)/n*sin(n*t)*(r/R)^n;
        end
        patch('faces',s,...
            'vertices',M','facecolor',colorinbandera3(cont),...
            'edgecolor',colorinbandera3(cont))
%         pause(0.05)
    end
end
