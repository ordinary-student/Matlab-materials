clear;
clc;
num=75*[0 0 0.2 1];%分子
den=[1 16 100 0]; %分母
sys=tf(num,den);%开环系统的传递函数
margin(sys);%
grid on;
figure;
bode(sys);
grid on;
