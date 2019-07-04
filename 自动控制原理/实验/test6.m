clear;
clc;
num=[10000];%分子
den=[1 5 100 0]; %分母
sys=tf(num,den);%开环传递函数
nyquist(sys);%绘制系统的奈奎斯特图
grid on;
