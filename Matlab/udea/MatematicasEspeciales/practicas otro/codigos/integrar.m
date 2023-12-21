function s=integrar(a,o,q)
syms n x
s=2/q*int(a*sin(n*pi*x/q),x,o);
end


