close all;
clear;

global Link
ROBOT = 'robot-2';
switch ROBOT
    case{'robot-2'}
        robot_2
end

ToDeg = 180/pi;
ToRad = pi/180;
DRAW = 1;
LAMBDA = 0.5;
num=1;
last_arm = length(Link);

i = linspace(-pi,pi,50);
y_paint = 5 * 16 .* sin(i).^3;
z_paint = 10 * (13 .* cos(i) - 5 .* cos(2*i) - 2 .* cos(3*i) - cos(4*i)) + 100;
params=[Link(3).th*ToDeg, Link(3).dy, Link(4).dy, Link(6).th*ToDeg, Link(7).th*ToDeg, Link(8).th*ToDeg]';

for i=1:length(i)
    P_ref = [0, y_paint(i), z_paint(i)]';
    R_ref = [0 1 0; 1 0 0; 0 0 -1];
    
    while (1)
        % Forward kinematic
        DH_forward_kinematics(ROBOT,params);
        x(num)=Link(last_arm).p(1);
        y(num)=Link(last_arm).p(2);
        z(num)=Link(last_arm).p(3);
        
        if(DRAW == 1)
            DrawRobot(Link,1)
            plot3(x,y,z,'ro','MarkerFaceColor','w','MarkerSize', 5);hold on;
        end
        
        % Caculate the errors
        P_n = Link(last_arm).p(1:3);
        P_err = P_ref - P_n;
        R_err = Link(last_arm).R' * R_ref;
        theta = acos((R_err(1,1)+R_err(2,2)+R_err(3,3)-1)/2);
        W_err = [0;0;0];
        if (theta > (0.1*(pi/180))) % 1/10 radians
            W_err = theta/(2*sin(theta)) * ...
                [R_err(3,2)-R_err(2,3); R_err(1,3)-R_err(3,1); R_err(2,1)-R_err(1,2)];
        end
        err = norm(P_err, 2) + norm(W_err, 2);
        if (err<0.1) % if errors are small enough, break the while loop.
            break
        end

        % Jocobi Matrix
        Wa_1 = Link(2).a(1:3);
        Wa_2 = Link(3).a(1:3);
        Wa_3 = Link(4).a(1:3);
        Wa_4 = Link(5).a(1:3);
        Wa_5 = Link(6).a(1:3);
        Wa_6 = Link(7).a(1:3);
        J = [cross(Wa_1, P_n-Link(2).p(1:3)), ...
            Wa_2,...
            -Wa_3,...
            cross(Wa_4, P_n-Link(4).p(1:3)),...
            cross(Wa_5, P_n-Link(5).p(1:3)),...
            cross(Wa_6, P_n-Link(6).p(1:3));...
            Wa_1, zeros(3,1), zeros(3,1), Wa_4, Wa_5, Wa_6];

        % Caculate the joint variable
        delta = LAMBDA * (J \ [P_err; W_err]); % inv(J) * [P_err; W_err];
        params = params + delta;
    end
    num=num+1;
    i
end
DrawRobot(Link,0)
plot3(x,y,z,'ro','MarkerFaceColor','w','MarkerSize', 5);hold on;