q='[[-2 2],[ -3 3],[ -5 5]]'
a=str2num(q);
arr={};
n=0;
for i=1:length(a)/2
  arr(1,i)=[a(1,i+n) a(1,i+1+n)]
  n=n+1;
end