syms x y z
f=2*x*y+x

if diff(f,x,2)+ diff(f,y,2)== 0
    disp('La funcion es armonica')
    a=diff(f,x);
    b=int(a,y);
    
    c=diff(f,y);
    d=diff(b,x);
    cte=c-d;
    rcte=int(cte,x);
    v=-b+rcte;
    
    g=v+j*f;
    in1=inline(string(f));
    in2=inline(string(v));
    c1=in1(z,0);
    c2=in2(z,0);
    g2= c1+j*c2
    disp(v)

end



%u=simplify(real(f));
%v=imag(f)
%disp(v)
%disp(u)

%if diff(u,x)==diff(v,y) & diff(u,y)==-diff(v,x)
 %   disp('La funcion es analitica')
    
    
%else 
 %   disp('La funcion no es analitica')

%end