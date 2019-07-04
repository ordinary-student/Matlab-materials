clear;
clc;
num=75*[0 0 0.2 1];%分子
den=[1 16 100 0]; %分母
GH=tf(num,den);%开环传递函数
sys=feedback(GH,1);%闭环传递函数
t=0:0.01:30;%时间
step(sys,t);%绘制阶跃响应曲线
grid on;
