t = 2; %Tiempo de grabación
Fs = 44100; %Frecuencia de grabacion
v = audiorecorder(Fs, 24, 1); %Frecuencia, Calidad audio:24, Monoesterio (mismo canal)
v.StartFcn = 'disp(''   iniciando grabación'')';
v.StopFcn = 'disp(''   terminando grabación'')';

input ('Las palabras a grabar son:\n BUSCAR, para entrar al navegador de google\n MUSICA, para escuchar una canción\n IMAGEN, para abrir una imagen\n ABRIR, para abrir un documento en Word\n MOVER, para mover el mouse\n APLICACIÓN, para abrir una aplicación\n PERIÓDICO, para buscar en el navegador la palabra periódico\n NOTAS, para abrir Bloc de Notas\nPresione enter para grabar');
%impresion de pantalla
recordblocking(v, t) %inicia la grabación en tanto timepo
y = v.getaudiodata(); %al terminar la grabación se guarda en y
audiowrite ('grabacion1.wav',y,Fs); %guarda el sonido en formato wav
which 'grabacion1.wav'
%sound(y,Fs);%reproduce sonido%

close all;
clear all;

s = audioread('grabacion1.wav');
s = normalizar(s);
voz1 = abs(fft (s)); % se obtiene la transformada de fourier de la primera grabacion

b = audioread('grabacion_buscar.wav');
mu = audioread('grabacion_musica.wav');
i = audioread('grabacion_imagen.wav');
ab = audioread('grabacion_abrir.wav');
mo = audioread('grabacion_mover.wav');
ap = audioread('grabacion_aplicacion.wav');
p = audioread('grabacion_periodico.wav');
n = audioread('grabacion_notas.wav');

b = normalizar(b);
vozb = abs(fft (b)); % se obtiene la transformada de fourier de la grabacion
mu = normalizar(mu);
vozmu = abs(fft (mu)); % se obtiene la transformada de fourier de la grabacion
i = normalizar(i);
vozi = abs(fft (i)); % se obtiene la transformada de fourier de la grabacion
ab = normalizar(ab);
vozab = abs(fft (ab)); % se obtiene la transformada de fourier de la grabacion
mo = normalizar(mo);
vozmo = abs(fft (mo)); % se obtiene la transformada de fourier de la grabacion
ap = normalizar(ap);
vozap = abs(fft (ap)); % se obtiene la transformada de fourier de la grabacion
p = normalizar(p);
vozp = abs(fft (p)); % se obtiene la transformada de fourier de la grabacion
n = normalizar(n);
vozn = abs(fft (n)); % se obtiene la transformada de fourier de la grabacion

error(1) = mean(abs(voz1-vozb)); %error buscar
error(2) = mean(abs(voz1-vozmu)); %error musica
error(3) = mean(abs(voz1-vozi)); %error imagen
error(4) = mean(abs(voz1-vozab)); %error abrir
error(5) = mean(abs(voz1-vozmo)); %error mover
error(6) = mean(abs(voz1-vozap)); %error aplicacion
error(7) = mean(abs(voz1-vozp)); %error periodico
error(8) = mean(abs(voz1-vozn)); %error notas

min_error = min(error);

switch min_error %Prueba cada caso hasta que una de las expresiones Case sea verdadero
    case error(1)
        disp('Palabra: BUSCAR')
        url='https://www.google.com'
        web(url,'-browser')
    case error(2)
        disp('Palabra: MUSICA')
        url='https://www.youtube.com/watch?v=lJawRaON8h0'
        web(url,'-browser')
    case error(3)
        disp('Palabra: IMAGEN')
        A=imread('C:\Users\Sebastian Fajargo\Desktop\foto.jpg');
        imshow(A)
    case error(4)
        disp('Palabra: ABRIR')
        winopen thesis.docx
    case error(5)
        disp('Palabra: MOVER')
        set(0,'PointerLocation',[46 728]);
    case error(6)
        disp('Palabra: APLICACION')
        url='https://www.facebook.com'
        web(url,'-browser')
    case error(7)
        disp('Palabra: PERIODICO')
        url='https://www.google.com.co/search?q=periodico&rlz=1C1JZAP_esCO729CO729&oq=periodico&aqs=chrome..69i57j0l5.6226j0j4&sourceid=chrome&ie=UTF-8'
        web(url,'-browser')
    case error(8)
        disp('Palabra: NOTAS')
        texto=fopen('hola.txt','wt');
        fprintf(texto,'HOLA PROFE');
        winopen('hola.txt');
end