clc;clear all;close all
% Time series dari data
dt = 0.1;
t = 0:dt:50;
fs = 10;
% Parameter perhitungan estimasi
Nsampel = length(t);
Rsaved=zeros(Nsampel,1);
sinyal1=zeros(Nsampel,1);
Xsaved = zeros(Nsampel,1);
Zsaved = zeros(Nsampel,1);
Xpsaved = zeros(Nsampel,1);
Ksaved = zeros(Nsampel,1);

% Parameter dalam Kalman Filter
A = 1.0112111212; % matriks A
H = 1; % matriks H
 
Q = 0.11987; % variance dari w (noise pada random process)
R = 0.993; % variance dari v (noise pada pengukuran)

x = 0; % tebakan pertama estimasi state 
P = 1; % tebakan pertama matrix variance error
for k=1:Nsampel
  % Sinyal yg diganggu adalah sinyal sinus dengan frek 0.1 Hz
  sinyal=10*sin(2*pi*0.1*dt*k);
  rad=randn(1,1);
  Rsaved(k)=rad;
  sinyal1(k)=sinyal;
  z = sinyal +rad;
  % Apriori estimation
  xp = A*x;             %pers 1.9 estimasi hasil/ estimated nilai setelahnya
  Pp = A*P*A' + Q;      %pers 1.10 estimasi eror
  Xpsaved(k)=xp;
  % K=......
  K = Pp*H'*(H*Pp*H' + R)^(-1);     %kalman gain
  Ksaved(k)=K;
  % Posteriori estimation
  x = xp + K*(z - H*xp);
  P = Pp - K*H*Pp;
  Xsaved(k) = x;
  Zsaved(k) = z;
end
% figure(1)
% plot(t, Zsaved, 'b')
% hold on
% plot(t, Xsaved, 'r') 
% grid on
% title('Comparation Signal')
% ylabel('Magnitudo');xlabel('Waktu');legend('Non Filter','with filter')
% figure(2)
% plot(t,Xpsaved);title('Signal Apriori')
% ylabel('Magnitudo');xlabel('Waktu')
% figure(3)
% plot(t,Xsaved,'r');title('Signal Posteriori')
% ylabel('Magnitudo');xlabel('Waktu')
% figure(4)
% plot(t,Ksaved,'b');title('Kalman Gain')
% ylabel('Gain');xlabel('Waktu')
hasil=cov(Rsaved)
hasilSNR= snr(Xsaved,Zsaved-sinyal1)
SNRsebelum = snr(Zsaved,Zsaved-sinyal1)