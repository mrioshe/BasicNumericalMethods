function calculo_errores
clc
clear all
y_analitica=xlsread('soluciones1.xlsx','B2:B50002'); % Se lee los valores de y de la solución analitica
y_colocacion=xlsread('soluciones1.xlsx','C2:C50002'); % Se lee los valores de y aproximada por método de colocación
y_galerkin=xlsread('soluciones1.xlsx','D2:D50002'); % Se lee los valores de y aproximada por método de Galerkin
y_min_cuadrados=xlsread('soluciones1.xlsx','E2:E50002'); % Se lee los valores de y aproximada por método de mín cuadráticos

x_1=xlsread('soluciones1.xlsx','F2:F50002'); % Se lee los valores de x para las aproximaciones anteriores

y_FEM_lineal10=xlsread('soluciones2.xlsx','B2:B12');  % Se lee los valores de y aproximada por método FEM funcion lineal
y_FEM_cuadratica10=xlsread('soluciones2.xlsx','C2:C12'); % Se lee los valores de y aproximada por método FEM funcion cuadratico
X_2=linspace(1,6,10+1); % Se genera vector de valores de x para las soluciones por FEM

A_analitica=trapz(x_1,y_analitica); % se halla area bajo la curva usando integracion númerica, método trapezoidal
A_colocacion=trapz(x_1,y_colocacion);
A__galerkin=trapz(x_1,y_galerkin);
A_min_cuadrados=trapz(x_1,y_min_cuadrados);
A_FEM_lineal10=trapz(X_2,y_FEM_lineal10);
A_FEM_cuadratica10=trapz(X_2,y_FEM_cuadratica10);

E_colocacion=abs(100*(A_analitica-A_colocacion)/A_analitica) % Calculo de errores con respecto a sln analítica
E_galerkin=abs(100*(A_analitica-A__galerkin)/A_analitica)
E_min_cuadrados=abs(100*(A_analitica-A_min_cuadrados)/A_analitica)
E_FEM_lineal10=abs(100*(A_analitica-A_FEM_lineal10)/A_analitica)
E_FEM_cuadratica10=abs(100*(A_analitica-A_FEM_cuadratica10)/A_analitica)
end

