x=linspace(0,1,11);% el x va desde cero hasta uno
y=linspace(0,1,11);% el y va desde cero hasta uno
[X Y]=meshgrid(x,y);% crea una matriz de filas por columnas
for i=1:length(y) %recorre la distancia y ("once")
    for j=1:length(x)%recorre la distancia x mientras esta recorriendo a y
        plot(X(i,j),Y(i,j),'ob')%me crea el recorrido de puntos pero solo muestra un punto
        M(length(x)*(i-1)+j,:)=[X(i,j),Y(i,j)]
        hold on % me pone todos los puntos en la grafica
        axis([-0.1 1.1 -0.1 1.1])%la grafica empezara desde -0.1 hsta 1.1 en x y y de la grafica
    end
end
for j=1:length(y)-1%recorre la distncia de y menos uno; hasta 10        
    for i=1:length(x)-1%recorre la distncia de x menos uno; hasta 10
        if j==2
          s=[length(x)*(j-1)+(length(x)-i),length(x)*(j-1)+(length(x)-i)+1,...
              length(x)*(j-1)+(length(x)-i)+length(x)+1,length(x)*(j-1)+(length(x)-i)+length(x)]  
        elseif j==4
             s=[length(x)*(j-1)+(length(x)-i),length(x)*(j-1)+(length(x)-i)+1,...
              length(x)*(j-1)+(length(x)-i)+length(x)+1,length(x)*(j-1)+(length(x)-i)+length(x)]
        elseif j==6
             s=[length(x)*(j-1)+(length(x)-i),length(x)*(j-1)+(length(x)-i)+1,...
              length(x)*(j-1)+(length(x)-i)+length(x)+1,length(x)*(j-1)+(length(x)-i)+length(x)]
        elseif j==8
             s=[length(x)*(j-1)+(length(x)-i),length(x)*(j-1)+(length(x)-i)+1,...
              length(x)*(j-1)+(length(x)-i)+length(x)+1,length(x)*(j-1)+(length(x)-i)+length(x)]
        elseif j==10
             s=[length(x)*(j-1)+(length(x)-i),length(x)*(j-1)+(length(x)-i)+1,...
              length(x)*(j-1)+(length(x)-i)+length(x)+1,length(x)*(j-1)+(length(x)-i)+length(x)]
        else
            s=[length(x)*(j-1)+i,length(x)*(j-1)+i+1,length(x)*(j-1)+i+length(x)+1,length(x)*(j-1)+i+length(x)]
        end
        fac((length(x)-1)*(j-1)+i,:)=s
        cont=(length(x)-1)*(j-1)+i
        patch('faces',s,'vertices',M,'facecolor',colorin3(cont),...
            'edgecolor',colorin3(cont))
        pause(0.005)
    end
end

        
