function C=colorinchan(puntos)

P=63*(puntos)+1;      % recta hallada anterioremnte, puntos (1,1) hace las veces de x, s hace las veces de y

    if 1<=P && P<=8
        r=0;g=0;b=(16*(P-1)+143)/255;
        C=[r g b];
    end

    if P>8 && P<=24
        r=0;g=(16*(P-9)+16)/256;b=1;
        C=[r g b];
    end
   
    if P>24  && P<=40         % se evalua hasta 39
     r=(16*(P-25)+16)/256 ;g=1; b=(-16*(P-24)+256)/256;
     C=[r g b];
    end
    
    if P>40 && P<=56
        r=1; g=(-16*(P-40)+256)/256; b=0;
        C=[r g b];
    end
    
    if P>56 && P<=64
        r=(-16*(P-57)+239)/256;    g=0;  b=0;
        C=[r g b];
    end
    
end





