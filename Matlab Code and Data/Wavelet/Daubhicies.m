clc;clear;close all
fs=10;
N=1000;
dt=1e-3;
t=0:dt:1-dt;
Zsaved = zeros(N,1);
% lev=2;
for n=1:N
    sinyal(n)=sin(2*pi*fs*dt*n);
    er(n)=randn(1,1);
    z(n)=sinyal(n)+er(n);
%     Zsaved(n) = z;
end

w=modwt(z,'db2');
%Level 3 Daubechies
plot(t,z,'k')
hold on
plot(t,w(3,:),'r')
title('Level 3 Daubechies')
xlabel("time(s)")
ylabel("amplitude")
legend("Sinyal Asli","Sinyal Daubechies")
hold off

%Level 3 Daubechies
figure
plot(t,z,'k')
hold on
plot(t,w(4,:),'r')
title('Level 4 Daubechies')
xlabel("time(s)")
ylabel("amplitude")
legend("Sinyal Asli","Sinyal Daubechies")
hold off