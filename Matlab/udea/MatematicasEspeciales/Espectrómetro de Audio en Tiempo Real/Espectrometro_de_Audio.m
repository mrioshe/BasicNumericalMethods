%*************************************************************************%
% Fourier y el sonido - El Traductor de Ingeniería
% Espetro de audio en tiempo real
% 
% Vea el video en el siguiente enlace antes de ejecutar este código
% https://www.youtube.com/watch?v=ceuRhnywL_w

%*************************************************************************%

%Inicio :)
clear all
audio=audiorecorder(44100,24,1); %Configuración de toma de muestras de audio
figure; %Crea figura vacía
Fl=5.55e3; %Parámetro de ajuste

for k=1:1000  %Durará unos pocos segundos, procurá tener el micrófono activado en tu PC
record(audio); %Empieza a tomar audio
pause(.01); %Pausa de .01 segundos
stop(audio); %Detiene la toma de muestras de audio
au=getaudiodata(audio); %En au se guarda el vector de datos de audio
auf=abs(fft(au)); %Módulo de la fft de los datos
clf %Limpia figura
plot(1:Fl/(length(au)/8):Fl,auf(1:end/8),'r','linewidth',1.5); %Plotea auf
xlim([0 Fl]); xlabel('Frecuencia [Hz]','FontSize',18); %Límites eje x fijos
ylim([0 800]); ylabel('|FFT(x[n])|','FontSize',18); %Límites eje y fijos
grid on %Adicionar grilla
hold on %Mantener curva
end 

%Fin :)
