clc; clear all;close all
msg=('Pls. wait and MAXIMIZE COLOR PLOTS!')
load('AlphaRhythm_5seconds.mat')
sinyal = alpha_5seconds';
fs=250;
N=length(sinyal);
N1 = 1024;

lev = 2;
wtecg = modwt(sinyal,'haar',lev);
mra = modwtmra(wtecg,'haar');

subplot(lev+2,1,1)
plot(sinyal)
title("sinyal asli")
    for kk = 2:lev+2
        subplot(lev+2,1,kk)
        plot(mra(kk-1,:))
        title(["level ke ",num2str(kk-1)])
    end
