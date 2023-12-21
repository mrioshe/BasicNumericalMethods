arintv='[-1 0],[0 1],[1 2]'
a=str2num(arintv);
arr={};
n=0;
for i=1:length(a)/2
  arr(1,i)=[num2cell(arintv(1,i+n)) num2cell(arintv(1,i+1+n))]
  n=n+1;
end

