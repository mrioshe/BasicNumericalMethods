%guarda los vocablos en excel 
tom=7;
voc=5;
for i=1:voc   
    disp('VOCABLO'+string(i));    
    for k=1:tom
        disp('TOMA #:'+string(k));
        pause(1)
        tiempo_grabacion=3;
        %Creacion de objeto para grabar la entrada de audio
        recObj = audiorecorder;
        %Graba tu voz durante tiempo de grabacion.
        disp('Start speaking.');
        recordblocking(recObj, tiempo_grabacion);
        disp('End of Recording.');
        frecuencia_muestreo=get(recObj,'SampleRate');
        % Reproducir la grabacion
        play(recObj)
        tomas = getaudiodata(recObj);
        L=size(tomas,1); %tamaño de la matriz, la voz esta aca
        N=2/(frecuencia_muestreo); %numero de datos que se toman
        ft=abs(fft(tomas))/round(L/2); 
        
        trf{1,k}=ft;
        % Almacena los datos en una matriz de doble precisión
        
        
%         ceros=find(tomas(:,1)==0);
%         tomas(ceros,:)=[];%quita todos los ceros
        
        
        % Grafica las muestras de audio
        plot(tomas);
        myRecording{1,k}=tomas; %guarda los datos sin la transformada de fourier
        
        
        %L=size(myRecording,1); %tamaño de la matriz, la voz esta aca
        %pause(3);
        %N=2/(frecuencia_muestreo); %numero de datos que se toman
        %ft=abs(fft(myRecording))/round(L/2); %transformada de fourier, se redondea por l/2
        %u=0:1/(N*round(L/2)):1/N; %particion en frecuencias 
        %plot(u',ft(1:round(L/2)+1));
        %axis([0 1000 0 0.01]);
        % Plot single-sided amplitude spectrum.
        %title('Espectro de Amplitude de una sola cara de y(t)');
        %xlabel('Frequencia (Hz)');
        %ylabel('|Y(f)|');
        pause(2)
        %c = smooth(u',ft(1:round(L/2)+1),0.1,'loess'); %filtro, trata de botar el ruido 
        %plot(u',ft(1:round(L/2)+1),'b.',u',c,'r-'); %trazar la misma funcion 
    end
    %EXCEL
    filename = 'tomas.xlsx';
    sheet = i;
    xlswrite(filename,trf{1,1},sheet,'A1');
    xlswrite(filename,trf{1,2},sheet,'B1');
    xlswrite(filename,trf{1,3},sheet,'C1');
    xlswrite(filename,trf{1,4},sheet,'D1');
    xlswrite(filename,trf{1,5},sheet,'E1');
    xlswrite(filename,trf{1,6},sheet,'F1');
    xlswrite(filename,trf{1,7},sheet,'G1');
    %EXCEL
    
    pro=(myRecording{1,1}+myRecording{1,2}+myRecording{1,3}+myRecording{1,4}+myRecording{1,5}+myRecording{1,6}+myRecording{1,7})/7;
    L=size(pro,1);
    proTRF=abs(fft(pro))/round(L/2);
    xlswrite(filename,proTRF,sheet,'H1');
    
    
    for j=1:tom
        error=mean(abs(proTRF-trf{1,j}));
        adeerror{1,j}=error;
    end
    for k=1:tom
        xlswrite(filename,adeerror{1,k},sheet,strcat('I',num2str(k)));
    end
    
end