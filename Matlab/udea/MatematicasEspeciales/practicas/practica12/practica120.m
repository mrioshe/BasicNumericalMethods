function practica120
uicontrol('style','pushbutton','position',[400 350 140 40],'string','Realizar acción','FontSize',12,'callback',@boton);

    function boton(atributos,timbre)
        recObj = audiorecorder;
        disp('Start speaking.')
        recordblocking(recObj, 3);
        disp('End of Recording.');
        play(recObj)
        %Store data in double-precision array.
        myRecording = getaudiodata(recObj);
        
        % Plot the waveform.
        plot(myRecording);
        L=size(myRecording,1);
        Fs=L;
        NFFT = 2^nextpow2(L); % Next power of 2 from length of y
        Y = fft(myRecording,NFFT)/L;
        f = Fs/2*linspace(0,1,NFFT/2+1);
        pause(2);
        %Plot single-sided amplitude spectrum.
        plot(f,2*abs(Y(1:NFFT/2+1)))
        title('Single-Sided Amplitude Spectrum of y(t)')
        xlabel('Frequency (Hz)')
        ylabel('|Y(f)|')
        pause(2)
        c = smooth(f,2*abs(Y(1:NFFT/2+1)),0.1,'loess');
        %plot(f,2*abs(Y(1:NFFT/2+1)),'b.',f,c,'r-')
        pause(2)
        
        
        prom_palabra1 = xlsread("C:\Users\PUTRY\Desktop\practica12\practica12.xls",'p1', 'G1:G16385');
        prom_palabra2 = xlsread("C:\Users\PUTRY\Desktop\practica12\practica12.xls",'p2', 'G1:G16385');
        prom_palabra3 = xlsread("C:\Users\PUTRY\Desktop\practica12\practica12.xls",'p3', 'G1:G16385');
        prom_palabra4 = xlsread("C:\Users\PUTRY\Desktop\practica12\practica12.xls",'p4', 'G1:G16385');
        
        
        error(1) = mean(abs(c-prom_palabra1)); 
        error(2) = mean(abs(c-prom_palabra2)); 
        error(3) = mean(abs(c-prom_palabra3)); 
        error(4) = mean(abs(c-prom_palabra4)); 
        
        min_error = min(error);
        
        switch min_error %Prueba cada caso hasta que una de las expresiones Case sea verdadero
            case error(1)
                disp('Palabra:Navegador')
                url='https://www.google.com'
                web(url,'-browser')
            case error(2)
                 disp('Palabra: IMAGEN')
                 A=imread('newplot.png');
                 imshow(A)
            case error(3)
                disp('Palabra: Puntero')
                set(0,'PointerLocation',[20 10])
            case error(4)
                disp('Palabra: Abrir')
                winopen practica_4_punto2.pdf   
        end
    end
end