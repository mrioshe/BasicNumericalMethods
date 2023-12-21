recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 5);
disp('End of Recording.');

% Play back the recording.
play(recObj)
% Store data in double-precision array.
myRecording = getaudiodata(recObj);

% Plot the waveform.
plot(myRecording);
L=size(myRecording,1);
Fs=L;
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(myRecording,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
pause(3);
% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
pause(5)
c = smooth(f,2*abs(Y(1:NFFT/2+1)),0.1,'loess');
plot(f,2*abs(Y(1:NFFT/2+1)),'b.',f,c,'r-')
