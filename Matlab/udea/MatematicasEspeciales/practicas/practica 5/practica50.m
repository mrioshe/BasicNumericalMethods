syms z
p=string(abs(z+2)>5)
q=split(p)
for i=1:length(q)
    if q{i,1}=="<" || q{i,1}==">"
        d=i
    end
end
w="";
for i=d+1:length(q)
    w=strcat(w,q{i,1});
end
if     str2num(q{d-1,1})>1
    v=str2num(q{d-1,1})/str2sym(w)
else
    v=str2sym(w)/str2num(q{d-1,1})
end