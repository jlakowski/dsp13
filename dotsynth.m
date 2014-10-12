function samples = dotsynth(duration, fund, nterms)

Fs = 44100;
T = 1/Fs;

t = 0:T:duration;


samples = t;
envelope = t;

hd =  squareCoeffs(nterms);

%make harmonic distortion vectors

hdn = hd/norm(hd);
%make fseries for sound
for i = 1:length(hd)
    samples = samples + hdn(i)*sin(2*pi*i*fund*t);
end
