uicontrol('style','edit','position',[220 240 60 20])
uicontrol('style','edit','position',[220 220 60 20])
uicontrol('style','text','position',[300 231 10 20],'string','|')
uicontrol('style','edit','position',[310 231 60 20])
uicontrol('style','text','position',[380 231 10 20],'string','|')
uicontrol('style','text','position',[390 231 10 20],'string','>')
uicontrol('style','edit','position',[400 231 60 20])

uicontrol('style','text','position',[300 200 10 20],'string','|')
uicontrol('style','edit','position',[310 200 60 20])
uicontrol('style','text','position',[380 200 10 20],'string','|')
uicontrol('style','text','position',[390 200 10 20],'string','<')
uicontrol('style','edit','position',[400 200 60 20])

syms z
f=z-3;
a=z-2;
x=f-a;
f1=1/(x-a);
s=0;
for k=1:10
    s=s-a^(k-1);
end

syms z
f=z^4-1;
v=solve(f);
p=z-1;
r=sqrt(2);
p1=solve(p);
m=1;

for k=1:length(v) %verificar en cada polo
    q=eval(norm(p1-v(k)));
    if q<=r
        polo(m)=v(k);
        m=m+1;
    end 
end 
