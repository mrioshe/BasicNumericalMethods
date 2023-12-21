q='[[-1 0],[0 1],[1 2]]'
a=str2num(q);
arintv={[-1 0],[0 1],[1 2]};
arint={};
n=0;
for i=1:length(a)/2
  arr(1,i)={[a(1,i+n) a(1,i+1+n)]}
  n=n+1;
end

