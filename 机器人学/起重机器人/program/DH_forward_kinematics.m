function DH_forward_kinematics(robot,params)
% close all

global Link
last_arm = length(Link);

switch robot
    case {'robot-1'}
        robot_1;
    case{'robot-2'}
        robot_2
end

if isempty(params) ~= 1
    switch robot
        case 'robot-1'
            th1 = params(1);
            dy2 = params(2);
            th3 = params(3);
            th4 = params(4);
            th5 = params(5);
            th6 = params(6);
            Link(3).th= th1*pi/180;
            Link(3).dy= dy2;
            Link(5).th= th3*pi/180;
            Link(6).th=th4*pi/180;
            Link(7).th=th5*pi/180;
            Link(8).th=th6*pi/180;
        case 'robot-2'
            th1 = params(1);
            dy2 = params(2);
            dy3 = params(3);
            th4 = params(4);
            th5 = params(5);
            th6 = params(6);
            Link(3).th = th1*pi/180;
            Link(3).dy = dy2;
            Link(4).dy = dy3;
            Link(6).th = th4*pi/180;
            Link(7).th = th5*pi/180;
            Link(8).th = th6*pi/180;
    end
end
% caculate the Matrix A and R
for i=1:last_arm
    Matrix_DH_Ln(i);
end

for i=2:last_arm
      Link(i).A= Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end




