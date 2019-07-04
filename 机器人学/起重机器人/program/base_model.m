close all;
clear;

global Link
ROBOT = 'robot-2';
switch ROBOT
    case{'robot-1'}
        robot_1;
    case{'robot-2'}
        robot_2
end

th=[0,0,0,0];
fcla=1;
num=1;
DRAW = 1;
last_arm = length(Link);

p0=[0,0,0]';


% params=[-120, 500, 150, -30, 0, -180]';
params=[]';
DH_forward_kinematics(ROBOT,params)

x(num)=Link(last_arm).p(1);
y(num)=Link(last_arm).p(2);
z(num)=Link(last_arm).p(3);
P_n = Link(last_arm).p(1:3);

DrawRobot(Link,0)
