clear all;close all;clc
x=linspace(0,1,50);
y=linspace(0,1,50);
[X, Y]=meshgrid(x,y);

for i=1:length(y)
    for j=1:length(x)
        %plot(X(i,j),Y(i,j),'ob')
        M(length(x)*(i-1)+j,:)=[X(i,j),Y(i,j)];
%         pause(0.01);
        hold on
        axis([-0.1 1.1 -0.1 1.1])
        
    end
end
for j=1:length(y)-1
    for i=1:length(x)-1
        s=[length(x)*(j-1)+i,...
            length(x)*(j-1)+i+1,...
            length(x)*(j-1)+i+length(x)+1,...
            length(x)*(j-1)+i+length(x)];
        fac((length(x)-1)*(j-1)+i,:)=s;
        cont=(length(x)-1)*(j-1)+i;
        patch('faces',s,'vertices',M,...
            'facecolor',colorin2(cont),...
            'edgecolor',colorin2(cont))
         %pause(0.5)
    end
end
