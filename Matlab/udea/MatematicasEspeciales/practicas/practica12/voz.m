function grabar_voz=voz(grabacion)
for i = 1:5
    recObj = audiorecorder;
    disp('Start speaking.')
    recordblocking(recObj, 3);
    disp('End of Recording.');
    hoja=grabacion;
    % Play back the recording.
    play(recObj)
    % Store data in double-precision array.
    myRecording = getaudiodata(recObj);
    
    % Plot the waveform.
    %plot(myRecording);
    L=size(myRecording,1);
    Fs=L;
    NFFT = 2^nextpow2(L); % Next power of 2 from length of y
    Y = fft(myRecording,NFFT)/L;
    f = Fs/2*linspace(0,1,NFFT/2+1);
    % pause(3);
    % Plot single-sided amplitude spectrum.
    %plot(f,2*abs(Y(1:NFFT/2+1)))
    %title('Single-Sided Amplitude Spectrum of y(t)')
    %xlabel('Frequency (Hz)')
    %ylabel('|Y(f)|')
    % pause(5)
    c = smooth(f,2*abs(Y(1:NFFT/2+1)),0.1,'loess');
    %plot(f,2*abs(Y(1:NFFT/2+1)),'b.',f,c,'r-')
    if i == 1
        xlswrite("C:\Users\PUTRY\Desktop\practica12\practica12.xls",c,hoja,"A1")
    end
    
    if i == 2
        xlswrite("C:\Users\PUTRY\Desktop\practica12\practica12.xls",c,hoja,"B1")
    end
    
    if i == 3
        xlswrite("C:\Users\PUTRY\Desktop\practica12\practica12.xls",c,hoja,"C1")
    end
    
    if i == 4
        xlswrite("C:\Users\PUTRY\Desktop\practica12\practica12.xls",c,hoja,"D1")
    end
    
    if i == 5
        xlswrite("C:\Users\PUTRY\Desktop\practica12\practica12.xls",c,hoja,"E1")
    end 
end
end
