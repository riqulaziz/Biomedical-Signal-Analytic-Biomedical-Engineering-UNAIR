clc;clear all; close all;

msg=('Pls. wait and MAXIMIZE COLOR PLOTS!')
load('ASB_UAS')
sinyal = x;
fs=8020;
N=length(sinyal);
N1 = 1024;                           % jumlah titik wavelet

resol_level = 128;                  % jumlah nilai a 
decr_a = .5;                        % penurunan a 
a_init = 4;                         % nilai awal a 
wo = pi*sqrt(2/log2(2));            % faktor skala frekuensi wavelet
b = (1:N)/fs;
ti = ((1:N1/2)/fs)*10;           % vektor waktu untuk membangun wavelet 

% Menghitung alihragam wavelet kontinyu (wavelet morlet) 
for i = 1:resol_level 
    a(i) = a_init/(1+i*decr_a);     % set skala 
    t = abs(ti/a(i));               % vektor skala untuk wavelet 
    mh= (1-(2*(t.^2))).*exp(-t.^2); 
    wavelet = [fliplr(mh) mh];     % membuat simetri terhadap nol 
    ip = conv(sinyal, wavelet);          % konvolusi wavelet dan sinyal 
    ex = fix((length(ip)-N)/2);     % menghitung titik tambahan/2 
    CW_Trans(:,i) = ip(ex+1:N+ex,1); 
end

%Plot dalam 3 dimensi 
figure 
d = fliplr(CW_Trans); 
mesh(a,b,CW_Trans) 
xlabel('skala a') 
ylabel('b (detik)') 
zlabel('CWT') 
title('Hasil CWT Menggunakan Maxican Hat') 
rotate3d on 


