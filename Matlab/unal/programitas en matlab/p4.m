%x=-3:0.05:3;
x = linspace(-3,3)
g = cos(pi()*x)
f_x =  g.^(-1)
plot(x,f_x)