%计算变换矩阵
close all;
clear;

ToDeg = 180/pi;%转为角度
ToRad = pi/180;%转为弧度

%定义D-H参数
syms theta d a alpha y;
T1 = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 1 0; 0 0 0 1];
T2 = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
T3 = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T4 = [1 0 0 0; 0 cos(alpha) -sin(alpha) 0; 0 sin(alpha) cos(alpha) 0; 0 0 0 1];
Ty = [1 0 0 0; 0 1 0 y; 0 0 1 0; 0 0 0 1];
T = T1 * T2 * Ty * T3 * T4;

%定义关节角
syms theta1 theta2 theta3 d4 theta5 theta6
theta=theta1;
d=100;
y=0;
a=0;
alpha = -90*ToRad;
A1 = subs(T);

theta=-90*ToRad+theta2;
d=0;
y=0;
a=100;
alpha = 0;
A2 = subs(T);

theta=theta3;
d=0;
y=50;
a=0;
alpha = -90*ToRad;
A3 = subs(T);

theta=0;
d=50+d4;
y=0;
a=0;
alpha = 0;
A4 = subs(T);

theta=theta5;
d=50;y=0;
a=0;
alpha = 90*ToRad;
A5 = subs(T);

theta=90*ToRad+theta6;
d=0;
y=0;
a=50;
alpha = 0;
A6 = subs(T);

A = A1 * A2 * A3 * A4 * A5 * A6;