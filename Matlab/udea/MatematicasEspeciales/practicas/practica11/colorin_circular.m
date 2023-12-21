function C=colorin_P(puntos)

s=63*abs((puntos))+1;      % recta hallada anterioremnte, puntos (1,1) hace las veces de x, s hace las veces de y
if s <1
    C=[0 0 0.4];
else 
    if 1<=s && s<=8
        r=0;g=0;b=(16*(s-1)+143)/255;
        C=[r g b];
    end

    if s>8 && s<=24
        r=0;g=(16*(s-9)+16)/256;b=1;
        C=[r g b];
    end
   
    if s>24  && s<=40         % se evalua hasta 39
     r=(16*(s-25)+16)/256 ;g=1; b=(-16*(s-24)+256)/256;
     C=[r g b];
    end
    
    if s>40 && s<=56
        r=1; g=(-16*(s-40)+256)/256; b=0;
        C=[r g b];
    end
    
    if s>56 && s<=64
        r=(-16*(s-57)+239)/256;    g=0;  b=0;
        C=[r g b];
    end
    
end





