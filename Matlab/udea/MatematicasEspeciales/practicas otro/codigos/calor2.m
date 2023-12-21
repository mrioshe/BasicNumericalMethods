x=0:20/100:20;
t=0:10/100:10;
syms y k

m=(2/20)*int((y*(20-10)/20)*sin(((k*pi)*y)/20),y,0,20);
for j=1:length(t)
    s=0;
    for n=1:20
        s=s+eval(subs(m,k,n))*sin(n*pi*x/10)*exp(-n^2*pi^2*t(j)/(20)^2)+(20-x)/20*t(j)+x/20*(10-t(j));
    end
    u(j,:)=s;
end
limite_min=min(min(u));
limite_max=max(max(u));