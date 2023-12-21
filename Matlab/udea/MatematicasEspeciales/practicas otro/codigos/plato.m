clear all;close all;clc
x=linspace(0,4,5);
y=linspace(0,4,5);
[X Y]=meshgrid(x,y);
figure
axis([-1 6 -1 6])
hold on
for i=1:length(x)
    for j=1:length(y)
        plot(X(i,j),Y(i,j),'ob')
        M(j+(i-1)*length(x),:)=[X(i,j) Y(i,j)]
        pause(0.3)
        %         if j~=5
        %             fac(j,:)=[j j+1 j+length(y)+1 j+length(y)];
        %         end
    end
end
for j=1:length(x)-1
    for i=1:length(y)-1
        fac(i+(j-1)*(length(x)-1),:)=[i+(j-1)*length(x),...
            i+(j-1)*length(x)+1,...
            i+(j-1)*length(x)+length(y)+1,...
            i+length(y)+(j-1)*length(x)];
        patch('faces',fac,'vertices',M)
        pause(0.3)
    end
end
