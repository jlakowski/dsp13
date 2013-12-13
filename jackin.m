n = 1500; %number of samples
Fs = 44100; %Sample frequency 
jack(1,n,1); %connect to jack
pause(10); %connect using jackqtl
figure;
hold on;

while true
    clf;
    A = jack();
    subplot(1,2,1)
    plot(A);
    axis([0 n -1 1]);
    title(['Waveform'])
    
    c = fft(A(1:n))/n;
    p = 2*abs( c(2:n/2)); % compute power at each frequency
    f = (1:n/2-1)*Fs/n;
    
    subplot(1,2,2)
    semilogy(f,p)
    axis([0 4000 10^-4 1])
    title(['Power Spectrum'])

    pause(.08);
end