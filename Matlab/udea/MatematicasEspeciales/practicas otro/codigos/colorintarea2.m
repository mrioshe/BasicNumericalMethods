function c=colorintarea2(m)
x= 64/255*m
if 0<=x && x<=8
    R=0;g=0;b=(127+16*x)/255
    c=[R,g,b]
end
    if  8<x && x<=24 %el intervalo va con respecto al numero del color del espectro
        if x~=24
            R=0;g=(16*(x-8))/255;b=1;
        else
            R=0;g=1;b=1;
        end
        c=[R,g,b];
    end
    if 24<x && x<=40
        if x~=40
            R=(16*(x-24))/255;g=1;b=(255-16*(x-24))/255;
        else
            R=1;g=1;b=0;
        end
        c=[R,g,b];
    end
    if 40<x && x<=56
        if x~=56
           R=1;g=(255-16*(x-40))/255;b=0;
        else
            R=1;g=0;b=0;
        end
        c=[R,g,b];
    end
    if 56<x && x<=64
        if x~=64
            R=(255-16*(x-56))/255;g=0;b=0;
        else
            R=0;g=0;b=0;
        end
        c=[R,g,b];
    end            
end

         