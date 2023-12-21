clear all;
tiempo_grabacion=3;
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, tiempo_grabacion);
disp('End of Recording.');
frecuencia_muestreo=get(recObj,'SampleRate');
% Play back the recording.
play(recObj)
% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the waveform.
plot(myRecording);
L=size(myRecording,1);

pause(3);
N=2/(frecuencia_muestreo);
ft=abs(fft(myRecording))/round(L/2);
u=0:1/(N*round(L/2)):1/N;
figure
plot(u',ft(1:round(L/2)+1))
 axis([0 1000 0 0.01])
% Plot single-sided amplitude spectrum.
title('Espectro de Amplitude de una sola cara de y(t)')
xlabel('Frequencia (Hz)')
ylabel('|Y(f)|')
pause(5)
figure
c = smooth(u',ft(1:round(L/2)+1),0.1,'loess');
plot(u',ft(1:round(L/2)+1),'b.',u',c,'r-')
