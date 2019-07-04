clear;
clc;
num=[0.25 1];%分子
den=[0.5 1 0];%分母
GH=tf(num,den);%开环系统的传递函数
sys=feedback(GH,1);%加负反馈，闭环系统
p=roots(sys.den{1});%闭环系统的极点
z=roots(sys.num{1});%闭环系统的零点
pzmap(sys,'r');%画出系统的零极点图
grid on;%画栅格
[p,z]=pzmap(sys)%输出零极点数据
