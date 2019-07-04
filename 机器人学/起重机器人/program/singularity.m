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

num=1;
radius    = 15;
len       = 30;
joint_col = 0;
DRAW = 0;
last_arm = length(Link);

switch ROBOT
    case {'robot-2'}
        for th1=-180:30:180-1
            for dy2= 50:50:500
                for dy3=30:60:270
                    for th4=-90:60:90
                        for th5 = -45:45:90
                             for th6 = -180:90:180-1
%                                 fprintf('%d %d %d %d %d %d \n',[th1,dy2,dy3,th4,th5,th6]');
                                params = [th1,dy2,dy3,th4,th5,th6];
                                DH_forward_kinematics(ROBOT,params); 

                                x(num)=Link(last_arm).p(1);
                                y(num)=Link(last_arm).p(2);
                                z(num)=Link(last_arm).p(3);
                                
                                % Jocobi Matrix
                                Wa_1 = Link(2).a(1:3);
                                Wa_2 = Link(3).a(1:3);
                                Wa_3 = Link(4).a(1:3);
                                Wa_4 = Link(5).a(1:3);
                                Wa_5 = Link(6).a(1:3);
                                Wa_6 = Link(7).a(1:3);
                                P_n = Link(last_arm).p(1:3);

                                J = [cross(Wa_1, P_n-Link(2).p(1:3)), ...
                                    Wa_2,...
                                    -Wa_3,...
                                    cross(Wa_4, P_n-Link(4).p(1:3)),...
                                    cross(Wa_5, P_n-Link(5).p(1:3)),...
                                    cross(Wa_6, P_n-Link(6).p(1:3));...
                                    Wa_1, zeros(3,1), zeros(3,1), Wa_4, Wa_5, Wa_6];
                                
                                % condition number:y=Jx the bigger the cond gets, the bigger the solution 'x' would be changed while y is changed.
                                cond(num) = norm(J,2) * norm(inv(J),2); 
                                num=num+1;
                                switch num
                                    case {9302}
                                        9302
                                        [th1, dy2, dy3, th4, th5, th6]
                                    case {9430}
                                        9430
                                        [th1, dy2, dy3, th4, th5, th6]
                                    case {9560}
                                        9560
                                        [th1, dy2, dy3, th4, th5, th6]
                                end
                                if(DRAW)
                                    DrawRobot(Link,1)
                                    plot3(x,y,z,'ro','MarkerFaceColor','w','MarkerSize', 5);hold on;
                                end
                             end
                        end
                    end
                end
            end
        end 
end
if (DRAW==0)
    DrawRobot(Link,0)
    scatter3(x,y,z,30,cond)
end




