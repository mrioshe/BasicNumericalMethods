t=sym("t")
funciones = '[[t+1],[-t+1],[0]]'
a=str2sym(funciones);
ar={t+1,-t+1,0}
arr={};
n=0;
for i=1:length(a)
  arr(1,i)= {a(i)}
end

