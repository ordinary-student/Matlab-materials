clear;
clc;
num=[10000];%分子
den=[1 5 100 0]; %分母
GH=tf(num,den);%开环传递函数
sys=feedback(GH,1);%闭环传递函数
t=0:0.01:0.6;%时间
step(sys,t);%绘制阶跃响应曲线图
grid on;