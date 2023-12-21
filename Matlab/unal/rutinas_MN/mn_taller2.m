%%%% mn_taller2.m
%%% clear elimina variables
%%% clc borra linea de comandos
%%% close cierra ventanas de figuras
clc, close all, clear all
global delta maxiter
delta = 1e-6;
maxiter = 15;
scrsz = get(groot,'ScreenSize');
%%%
set(0,'defaultaxesfontsize',16,'defaultaxeslinewidth',1.6,...
   'defaultlinelinewidth',2.3,'defaultpatchlinewidth',.7)
%%%%
%%% eje 1 c
% f = @(x) x.^2-x+2;
% fp = @(x) 2*x - 1;
% p0=-1.5;
% p1 = p0 - f(p0)/fp(p0)
% p2 = p1 - f(p1)/fp(p1)
% % %%% no hay convergencia en el metodo de Newton
%  [p0, err, k, y] = newton (f, fp, -1.5, delta, delta, maxiter)
% % %%% las dos raices de f son complejas
%  syms x
%  raices = vpasolve(f(x)==0,x)
%  x = linspace(-4,4);
%  figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
%  plot(x,f(x),'r'), grid on
% %%%% parabola abierta hacia arriba que no toca el eje x
%%% eje 2 
% h = @(x) 1./x;
% f = @(x) (x-2).^2 + (1./x-1).^2;
% %%% ceros de su derivada
% fp = @(x) 2*(x-2) + 2*(1./x-1).*(-1/x.^2);
% fpp = @(x) 2+2*(1./x-1).*(2./x^3)+2*(1./x^4);
% [p0, err, k, y] = newton (fp, fpp, 1, delta, delta, maxiter)
% x = linspace(0.5,3);
% figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
% plot(x,h(x),'r',2,1,'g*'), grid on
% title('1/x y (2,1)')

%%% eje 4 b
% f = @(x) 2.^-x+exp(x) + 2*cos(x) - 6;
% fp = @(x) -log(2)*2.^-x + exp(x) -2*sin(x);
% [p0, err, k, y] = newton (f, fp, 1.5, delta, delta, maxiter)
%   figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
%  fplot(f,'r',[1,3]),grid on

% %%%% eje 4 c
% f =@(x) x-tan(x);
% fp = @(x) 1-sec(x).^2;
%  [p0, err, k, y] = newton (f, fp, -.2, delta, delta, maxiter)
%  figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
% fplot(f,'r'),grid on
%  
%  figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
% fplot(f,[-0.005,0.005]),grid on
%%%

%%% eje 4 d
% f =@(x) 1./x-tan(x);
% fp = @(x) -1./x^2-sec(x).^2;
%  [p0, err, k, y] = newton (f, fp, -3.5, delta, delta, maxiter)
%  figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
% fplot(f,'r'),grid on
%  
%  figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
% fplot(f,[0.5,1]),grid on
%%%
%%%% eje 6 
f = @(x) x.*exp(x) - exp(x) + 1;
fp = @(x) x.*exp(x) + exp(x) - exp(x);
fpp = @(x) x.*exp(x) + exp(x) + exp(x) - exp(x);
f0=f(0)
fp0=fp(0)
fpp0=fpp(0)
%%% 0 es un cero de multiplicidad 3
%% el metodo de Newton es de convergencia lineal en este caso
  figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
 fplot(f,[-1,1]),grid on
  [p0, err, k, y] = newton (f, fp, .8, delta, delta, maxiter)
%%%% eje 7
f = @(x) x.^4+2*x.^3-7*x.^2+3;
fp = @(x) 4*x.^3 + 6*x.^2 - 14*x;
figure('Position',[scrsz(3)*2/3 scrsz(4)/2 scrsz(4)/2 scrsz(4)/3])
fplot(f,'r',[-4,2]),grid on
   syms x
   T = vpasolve(x^4+2*x^3-7*x^2+3 == 0,x);
  %% modificacion de rutina newton.m
  %% informa la lista de iterados y no solamente el ultimo
[list, err, k, y] = newtonlista (f, fp, 0.2, delta, delta, maxiter)
%p = 0.79128784;
p = 1.6180339887;
er = abs(list - p);
er1 = er(1:end-1);
er2 = (er(1:end-1)).^2;
T1 = [1:length(er1)]'; 
T2 = list(2:end);
T3 = er(2:end)./er1;
T4 = er(2:end)./er2;

 varNames = {'k','p_{k}','|p-p_{k}|/|p-p_{k-1}|',...
     '|p-p_{k}|/|p-p_{k-1}|^2'};
Ta = table(T1,T2,T3,T4,'VariableNames',varNames)
 
