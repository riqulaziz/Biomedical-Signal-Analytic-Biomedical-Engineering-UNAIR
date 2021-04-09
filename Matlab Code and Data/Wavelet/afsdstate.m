clc;clear all;close all;

bf=[-0.2 -0.4 0.5];
af=[1 -0.6 0.25 -0.2];
numerator = [-0.2,-0.4,0.5];
denum=[1,-0.6,0.25,-0.2];
ts= 0.1;
sys=tf(numerator,denum,ts)
[A,B,C,D]=tf2ss(bf,af)