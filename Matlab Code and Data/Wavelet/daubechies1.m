% daubechies1
% A level-1 Daubechies Wavelet Analysis

clear;close all;clc

% Define the Daub4 scaling (alpha) and wavelet (beta) coeff
alpha(1)=(1+sqrt(3))/(4*sqrt(2));
alpha(2)=(3+sqrt(3))/(4*sqrt(2));
alpha(3)=(3-sqrt(3))/(4*sqrt(2));
alpha(4)=(1-sqrt(3))/(4*sqrt(2));
beta(1)=alpha(4);
beta(2)=-alpha(3);
beta(3)=alpha(2);
beta(4)=-alpha(1);

% # of points
N=1024;                     

% input signal 
fs=10;
N=1000;
dt=1e-3;
t=0:dt:1-dt;
Zsaved = zeros(N,1);
lev=3;
for n=1:N
    sinyal(n)=sin(2*pi*fs*dt*n);
    er(n)=randn(1,1);
    g(n)=sinyal(n)+er(n);
%     Zsaved(n) = z;
end 

% Ignore the wrap around at the end!!
for m=1:N/2-2; 
    % Use direct formulas for t and f 
    a1(m)=(g(2*m-1)*alpha(1)+g(2*m)*alpha(2)+g(2*m+1)*alpha(3)+g(2*m+2)*alpha(4)); 
    d1(m)=(g(2*m-1)*beta(1)+g(2*m)*beta(2)+g(2*m+1)*beta(3)+g(2*m+2)*beta(4));
end;

% % The level-1 Daub4 transform
D1=[a1 d1];   
% 
for m=1:N/4-2; 
    % Use direct formulas for t and f 
    a2(m)=(a1(2*m-1)*alpha(1)+a1(2*m)*alpha(2)+a1(2*m+1)*alpha(3)+a1(2*m+2)*alpha(4)); 
    d2(m)=(a1(2*m-1)*beta(1)+a1(2*m)*beta(2)+a1(2*m+1)*beta(3)+a1(2*m+2)*beta(4));
end;
% 
% % The level-2 Daub4 transform
D2=[a2 d2 d1];

for m=1:N/8-2; 
    % Use direct formulas for t and f 
    a3(m)=(a2(2*m-1)*alpha(1)+a2(2*m)*alpha(2)+a2(2*m+1)*alpha(3)+a2(2*m+2)*alpha(4)); 
    d3(m)=(a2(2*m-1)*beta(1)+a2(2*m)*beta(2)+a2(2*m+1)*beta(3)+a2(2*m+2)*beta(4));
end;

% The level-3 Daub4 transform
D3=[a3 d3 d2 d1];

figure

plot(g,'r');
hold
plot(D2,'k');
% plot(D2,'b')
axis([0 1024 -5 5]);
xlabel ('Time (Sample#)')
ylabel ('Amplitude')
title(' Original Signal (red) and Level-1 Daubechies Transform (black)')