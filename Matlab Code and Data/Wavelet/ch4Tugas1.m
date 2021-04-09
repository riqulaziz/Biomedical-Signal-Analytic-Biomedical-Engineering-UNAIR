% pr4_1
% averaging
clc;
clear all;
close all;

sz=1024;
NOISE_TRIALS=randn(sz); % a [sz x sz] matrix filled with noise

SZ=1:sz;                        % Create signal with sinus 
SZ=SZ/(sz/2);                   % Divide the array SZ by sz/2
S=sin(2*pi*SZ);

% for i=1:sz;                     % create a noisy signal 
%     NOISE_TRIALS(i,:) = NOISE_TRIALS(i,:) + S;
% end;
% plot(NOISE_TRIALS(1,:))


%%%%%%%%1111111111
% NOISE_TRIALS(1,:)=NOISE_TRIALS(1,:)+S;
% NOISE_TRIALS(10,:)=NOISE_TRIALS(10,:)+S;
% NOISE_TRIALS(100,:)=NOISE_TRIALS(100,:)+S;
% NOISE_TRIALS(1000,:)=NOISE_TRIALS(1000,:)+S;
% average1=sum(NOISE_TRIALS(1,:))/sz
% average10=sum(NOISE_TRIALS(10,:))/sz
% average100=sum(NOISE_TRIALS(100,:))/sz
% average1000=sum(NOISE_TRIALS(1000,:))/sz
% figure
% hold
% % plot(NOISE_TRIALS(1,:),'g')
% % plot(NOISE_TRIALS(10,:),'b')
% % plot(NOISE_TRIALS(100,:),'r')
% % plot(NOISE_TRIALS(1000,:),'y')
% %%2222222
% for i=1:sz
%     msNoise(i)=(rms(NOISE_TRIALS(i,:))).^2;
% end
% plot(msNoise)

%%%%3333333
for i =1:sz
    y(i)=rms(NOISE_TRIALS(i,:)); %%%noise
    x(i)=rms(S(i));    %% signal
    z(i)=x(i)/y(i);
    snrSignal(i) = 20*log(z(i));
end
plot(snrSignal)
% average=sum(NOISE_TRIALS)/sz;   % create the average
% odd_average=sum(NOISE_TRIALS(1:2:sz,:))/(sz/2);
% even_average=sum(NOISE_TRIALS(2:2:sz,:))/(sz/2);
% noise_estimate=(odd_average-even_average)/2;
% 
% figure
% hold
% plot(NOISE_TRIALS(1,:),'g')
% plot(noise_estimate,'k')
% plot(average,'r')
% plot(S)
% title('Average RED, Noise estimate BLACK; Single trial GREEN, Signal BLUE')

