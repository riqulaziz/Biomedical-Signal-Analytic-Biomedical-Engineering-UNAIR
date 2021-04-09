close all;clear;clc;
%Spektrum Delta
fs = 1000;						% Sample frequency
N = 1024;						% Number of points in waveform
freqsin = [.63 1.1 2.7 5.6]; 	% Sinusoid frequencies
ampl = [1.2 1 1.2 .75 ];			% Amplitude of sinusoid
% h0 = daub(6);                  	% Get filter coeff. 
[xn t] = signal(freqsin,ampl,N); 	% Construct signal
figure
plot(xn,'k')                 %sinyal sebelum noise
x = xn + (.25 * randn(1,N));		% Add noise
hold on 
plot(x,'r')
title('sinyal asli setelah ditambah noise')
[baris,kolom]=size (x);
% Call The Function : 
% t = 0:1/fs:1; 
% waveletFunction = 'db8'; 
waveletFunction = 'db4';
for j=1:kolom
[A4,D1,D2,D3,D4]=Wavelet(x,waveletFunction);
end
figure;plot(A4)
title ('A4')
figure;plot(D1)
title ('D1')
figure;plot(D2)
title ('D2')
figure;plot(D3)
title ('D3')
figure;plot(D4)
title ('D4')