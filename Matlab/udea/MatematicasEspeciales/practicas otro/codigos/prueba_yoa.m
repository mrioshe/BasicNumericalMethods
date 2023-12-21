%
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording1 = getaudiodata(recObj)
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording2 = getaudiodata(recObj)
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording3= getaudiodata(recObj)
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording4 = getaudiodata(recObj)
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording5 = getaudiodata(recObj)
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording6 = getaudiodata(recObj)
% tiempo_grabacion=3;
% recObj = audiorecorder;
% disp('Start speaking.')
% recordblocking(recObj, tiempo_grabacion);
% disp('End of Recording.');
%
% frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
% myRecording7 = getaudiodata(recObj)
% for i=1:24000
%     promedio=(myRecording1(i)+myRecording2(i)+myRecording3(i)+myRecording4(i)+myRecording5(i)+myRecording6(i)+myRecording7(i))/7;
%     myRecording(i,1)=promedio;
% end
% pos=find(myRecording(:,1)==0);
% myRecording(pos,:)=[]
% plot(myRecording);%myRecording esta grabada la voz
% L=size(myRecording,1);%toma tamaño de la grabacion
% pause(3);
% N=2/(frecuencia_muestreo);
% ft=abs(fft(myRecording))/round(L/2);%transformada de fourier-sin decimales round(L/2)
%
%
% u=0:1/(N*round(L/2)):1/N;
% plot(u',ft(1:round(L/2)+1))
% findpeaks(ft(1:round(L/2)+1))
%
% axis([0 1000 0 0.01])%grafica el espectro
% % Plot single-sided amplitude spectrum.
% title('Espectro de Amplitude de una sola cara de y(t)')
% xlabel('Frequencia (Hz)')
% ylabel('|Y(f)|')
% pause(5)
% c = smooth(u',ft(1:round(L/2)+1),0.1,'loess');%filtro, borra el ruido
% plot(u',ft(1:round(L/2)+1),'b.',u',c,'r-')
% xlswrite('voces.xlsx',myRecording,'Sheet1','A1')

[y,Fs] = audioread('Amor_y_control.mp3');
sound(y,Fs);