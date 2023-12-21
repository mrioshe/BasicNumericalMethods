t = 3; %Tiempo de grabación
Fs = 44100; %Frecuencia de grabacion
v = audiorecorder; %Frecuencia, Calidad audio:24, Monoesterio (mismo canal)
v.StartFcn = 'disp(''Start speaking.'')';
v.StopFcn = 'disp(''End of Recording.'')';

input ('Las palabras a grabar son:\n ARRIBA, para subir el cursor\n MUSICA, para escuchar una canción\n IMAGEN, para abrir imagen\n VIDEO, para abrir youtube\n JUEGO, para abrir pagina de juegos\n Presione enter para grabar');
%impresion de pantalla
recordblocking(v,t) %inicia la grabación en tanto timepo
voz=getaudiodata(v); %al terminar la grabación se guarda en voz
L=size(voz,1); %tamaño de la matriz, la voz esta aca
frecuencia_muestreo=get(recObj,'SampleRate');
N=2/(frecuencia_muestreo); %numero de datos que se toman
ft=abs(fft(voz))/round(L/2);

%Arriba
filename = 'tomas.xlsx';
sheet = 1;
promedio_arriba = xlsread(filename,sheet,'H:H');
%plot(promedio_arriba,'c')

%pause(3)

%Imagen
filename = 'tomas.xlsx';
sheet = 2;
promedio_imagen = xlsread(filename,sheet,'H:H');
%plot(promedio_imagen)
%pause(3)

%Musica
filename = 'tomas.xlsx';
sheet = 3;
promedio_musica = xlsread(filename,sheet,'H:H');
%plot(promedio_musica,'m')
%pause(3)

%Video
filename = 'tomas.xlsx';
sheet = 4;
promedio_video = xlsread(filename,sheet,'H:H');
%plot(promedio_video)
%pause(3)

%Juego
filename = 'tomas.xlsx';
sheet = 5;
promedio_juego = xlsread(filename,sheet,'H:H');
%plot(promedio_juego,'g')

%Error
error(1) = mean(abs(voz-promedio_arriba)); %error arriba
error(2) = mean(abs(voz-promedio_imagen)); %error imagen
error(3) = mean(abs(voz-promedio_musica)); %error musica
error(4) = mean(abs(voz-promedio_video)); %error video
error(5) = mean(abs(voz-promedio_juego)); %error juego

min_error = min(error);

switch min_error %Prueba cada caso hasta que una de las expresiones Case sea verdadero
    case error(1)
        disp('Palabra: ARRIBA')
        for i=1:1000
            set(0,'PointerLocation',[100 i]);
            pause(0.001)
        end
    case error(2)
        disp('Palabra: IMAGEN')
        A=imread('manos.jpg');
        imshow(A)
    case error(3)
        disp('Palabra: MUSICA')
        [y,Fs] = audioread('Amor_y_control.mp3');
        sound(y,Fs);
        
    case error(4)
        disp('Palabra: Video')
        url='https://www.youtube.com/watch?v=HL4HjQwMx-o';
        web(url,'-browser')
    case error(6)
        disp('Palabra: JUEGO')
        url='http://www.friv.com/z/games/xtrialracing/game.html?Windows-x-x-w-x-x-xx';
        web(url,'-browser')
        
end