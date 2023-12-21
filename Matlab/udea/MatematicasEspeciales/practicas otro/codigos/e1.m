Sd=0;
tiempo_grabacion=2;
recObj = audiorecorder;
disp(strcat('Start speaking'))
recordblocking(recObj, tiempo_grabacion);
disp(strcat('End of Recording'));
frecuencia_muestreo=get(recObj,'SampleRate');
% % Play back the recording.
% play(recObj)
% % Store data in double-precision array.
myRecording = getaudiodata(recObj);
% Plot the waveform.
plot(myRecording);
L=size(myRecording,1);
pause(3);
N=2/(frecuencia_muestreo);
ft=abs(fft(myRecording))/round(L/2);
u=0:1/(N*round(L/2)):1/N;
plot(u',ft(1:round(L/2)+1))
axis([0 1000 0 0.01])
% Plot single-sided amplitude spectrum.
title('Espectro de Amplitude de una sola cara de y(t)')
xlabel('Frequencia (Hz)')
ylabel('|Y(f)|')
pause(1)
palabra=smooth(u',ft(1:round(L/2)+1),0.1,'loess');
palabra1=xlsread("tomas2.xlsx",1,'A1:A8001');
palabra2=xlsread("tomas2.xlsx",2,'A1:A8001');
palabra3=xlsread("tomas2.xlsx",3,'A1:A8001');
palabra4=xlsread("tomas2.xlsx",4,'A1:A8001');
palabra5=xlsread("tomas2.xlsx",5,'A1:A8001');
error(1)=mean(abs(palabra-palabra1));
error(2)=mean(abs(palabra-palabra2));
error(3)=mean(abs(palabra-palabra3));
error(4)=mean(abs(palabra-palabra4));
error(5)=mean(abs(palabra-palabra5));
minError=min(error);
disp(minError)
switch minError
    case error(1)
        disp('Word')
        winopen("Terapia.docs")
    case error(2)
        disp('cursor')
        N_times = 180;
        desp_x = 2;
        desp_y = -2;
        pause_sec = 15e-3;
        for i = 1:N_times
            cursor_pos = get( 0,'PointerLocation' );
            cursor_pos(1) = cursor_pos(1) + desp_x;
            cursor_pos(2) = cursor_pos(2) + desp_y;
            set( 0,'PointerLocation', cursor_pos );
            pause( pause_sec );
        end
    case error(3)
       disp("Musica")
       web('https://www.youtube.com/watch?v=m2N-rk_Y6rw&list=RDm2N-rk_Y6rw&start_radio=1','-browser')
    case error(4)
        disp("imagen")
        A=imread('C:\Users\Manuela\Downloads\2.png');
        imshow(A)
    case error(5)
        disp("Universidad")
        url='http://www.udea.edu.co/wps/portal/udea/web/inicio/!ut/p/z1/04_Sj9CPykssy0xPLMnMz0vMAfIjo8ziLSydjQwdTQx8LAws3AwcA0N8XE1CfQ0M_E31wwkpiAJKG-AAjgZA_VFgJXATDLwNTYEmuAb4hfg7B7h4GUEV4DGjIDfCINNRUREATA0gew!!/dz/d5/L2dBISEvZ0FBIS9nQSEh/';
        web(url,'-browser')
end