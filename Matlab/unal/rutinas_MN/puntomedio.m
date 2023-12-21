function  P = puntomedio (f, a, b, ya, M)

% Entrada   - f es la funcion introducida como una cadena de caracteres  'f'
%           - a y b son los extremos izquierdo y derecho
%           - ya es la condicion inicial  y(a)
%           - M es el numero de pasos
% Salida    - P = [T', Y'] donde  T  es el vector de abscisas y
%             Y es el vector de ordenadas

%----------------------------------------------------------------------
%  RENOMBRAMOS LA RUTINA DEL METODO DE HEUN CORRESPONDIENTE AL TEXTO:
%----------------------------------------------------------------------
%  METODOS NUMERICOS: Programas en Matlab
% (c) 2004 por John H. Mathews y Kurtis D. Fink
%  Software complementario acompa�ando al texto:
%  METODOS NUMERICOS con Matlab, Cuarta Edicion
%  ISBN: 0-13-065248-2
%  Prentice-Hall Pub. Inc.
%  One Lake Street
%  Upper Saddle River, NJ 07458

h = (b - a) / M;
T = zeros(1, M+1);
Y = zeros(1, M+1);
T = a:h:b;
Y(1) = ya;
for  j = 1:M
   k1 = feval(f, T(j), Y(j));
   Y(j+1) = Y(j) + h * feval(f, T(j) + h/2, Y(j) + (h/2)*k1 );
end

P = [T', Y'];
