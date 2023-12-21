function [c]=colorin3chan(m)
x=64/200*m;
if 0<=x && x<=7
    R=0;
    g=0;
    b=(143+16*x)/255;
end
    
if 7<x && x<=22
    if x~=22
        R=0;
        g=(16*(x-6))/255;
        b=1;
    else
        R=0;
        g=1;
        b=1;
    end

end

if 22<x && x<=38
    if x~=38
    R=(16*(x-22))/255;
    g=1;
    b=(255-(16*(x-22)))/255;
    else 
        R=1;
        g=1;
        b=0;
    end
end
    
if 38<x && x<=54
    if x~=54 
    R=1;
    g=(255-(16*(x-38)))/255;
    b=0;
    else 
        R=1;
        g=0;
        b=0;
    end

end
    
if 54<x && x<=64
    R=(239-(16*(x-54)))/255;
    g=0;
    b=0;

end
    c=[R,g,b];
end