x=linspace(0,4,5)
y=linspace(0,4,5)
[X Y]=meshgrid(x,y)
figure
axis([-1 6 -1 6])
hold on
for i=1:length(x)
    for j=1:length(y)
        plot(X(i,j),Y(i,j),'ob')
        M(j+(i-1)*length(x),:)=[X(i,j) Y(i,j)];
        pause(0.7)
        %if j~=5
         %   fac(j,:)=[j j+1 j+1+length(y) j+length(y)];
        %end
    end
end
%patch('faces',[1 2 6 7],'vertices',M)
for j=1:length(x)-1
    for i=1:length(y)-1
        fac(i+(j-1)*(length(x)-1),:)=[length(x)*(j-1)+i,...
            length(x)*(j-1)+i+1,...
            length(x)*(j-1)+i+length(x)+1,...
            length(x)*(j-1)+i+length(x)];
        patch('faces',fac,'vertices',M);
        pause(0.3)
    end

end
    
    
    
    
    
    
    
    
    