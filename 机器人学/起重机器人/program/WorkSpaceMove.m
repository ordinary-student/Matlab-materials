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
DRAW = 1;
last_arm = length(Link);

switch ROBOT
    case {'robot-1'}
        for th1=-180:30:180-1
            for dy2= 50:50:500
                for th3=-180:45:180-1
                    for th4=-90:90:90
                        for th5 = -45:45:90
                             for th6 = -180:90:180-1
                                fprintf('%d %d %d %d %d %d \n',[th1,dy2,th3,th4,th5,th6]');
                                params = [th1,dy2,th3,th4,th5,th6];
                                DH_forward_kinematics(ROBOT,params); 

                                x(num)=Link(last_arm).p(1);
                                y(num)=Link(last_arm).p(2);
                                z(num)=Link(last_arm).p(3);
                                num=num+1;
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
    case {'robot-2'}
        for th1=-180:30:180-1
            for dy2= 50:50:500
                for dy3=30:60:270
                    for th4=-90:45:90
                        for th5 = -45:45:90
                             for th6 = -180:90:180-1
                                fprintf('%d %d %d %d %d %d \n',[th1,dy2,dy3,th4,th5,th6]');
                                params = [th1,dy2,dy3,th4,th5,th6];
                                DH_forward_kinematics(ROBOT,params); 

                                x(num)=Link(last_arm).p(1);
                                y(num)=Link(last_arm).p(2);
                                z(num)=Link(last_arm).p(3);
                                num=num+1;
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
end
  
                      



