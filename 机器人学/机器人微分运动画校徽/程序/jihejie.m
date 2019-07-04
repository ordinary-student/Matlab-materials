% Function: Build my robot
% Date: 2018/04/09
clc
clear all
syms th1 dz th3 th4 th5 th6

% 1 -> 3
trans_13_x = (dz+100)*sin(th1);
trans_13_y = (dz+100)*cos(th1);
trans_13_z = 0;

% 1 -> 4
trans_14_x = trans_13_x + 100*sin(th3);
trans_14_y = trans_13_y + 100*cos(th3);
trans_14_z = trans_13_z;

% 1 -> 5
trans_15_x = trans_14_x;
trans_15_y = trans_14_y + 100 * sin(th4);
trans_15_z = trans_14_z + 100 * cos(th4);

% 1 -> 6
trans_16_x = trans_15_x;
trans_16_y = trans_15_y + 50 * sin(th5);
trans_16_z = trans_15_z + 50 * cos(th5);

% 1 -> 7
trans_17_x = trans_16_x + 50 * sin(th6)
trans_17_y = trans_16_y
trans_17_z = trans_16_z + 50 * cos(th6)








