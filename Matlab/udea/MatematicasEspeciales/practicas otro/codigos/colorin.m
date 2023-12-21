function c=colorin(a)
x=(64/200)*a;
if 0<=x && x<=7
    R=0;g=0;b=(143+16*x)/255;
    c=[R,g,b];
    
end

if  7<x && x<=22 %el intervalo va con respecto al numero del color del espectro
    if x~=22
        R=0;g=(16*(x-7))/255;b=1;
    else
        R=0;g=1;b=1;
    end
    c=[R,g,b];
    
end
if 22<x && x<=37
    if x~=37
        R=(16*(x-22))/255;g=1;b=(255-16*(x-22))/255;
    else
        R=1;g=1;b=0;
    end
    c=[R,g,b];
end
if 37<x && x<=52
    if x~=52
        R=1;g=(255-16*(x-37))/255;b=0;
    else
        R=1;g=0;b=0;
    end
    c=[R,g,b];
    
    
end
if 52<x && x<=64
    
    R=(255-16*(x-52))/255;g=0;b=0;
    
    c=[R,g,b];
    
end
end
