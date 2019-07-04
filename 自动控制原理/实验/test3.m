clear;
clc;
num=[1];%分子
den=[0.5 1.5 1 0]; %分母
sys=tf(num,den);%开环系统传递函数
p=roots(sys.den{1});%开环系统的极点
z=roots(sys.num{1});%开环系统的零点
rlocus(sys);%开环系统的根轨迹
[p,z]=pzmap(sys)%开环系统的零极点