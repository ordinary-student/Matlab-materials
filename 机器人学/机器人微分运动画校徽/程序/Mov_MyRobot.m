% Function: Move my robot and draw the workspace
% Date: 2018/04/06
clc;
clear all;
global Link
figure; 

th1=0;
dz=0;
th3=0;
th4=0;
th5=0;
th6=0;
stp=10;
dtime=0.01;
Link_MyRobot(th1,dz,th3,th4,th5,th6,0); 
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for th=0:stp:180
   Link_MyRobot(th,dz,th3,th4,th5,th6,1); 
end
for th=180:-stp:-180
   Link_MyRobot(th,dz,th3,th4,th5,th6,1); 
end

for th=-180:stp:0
    if th~=0
       Link_MyRobot(th,dz,th3,th4,th5,th6,1); 
    else
       Link_MyRobot(th,dz,th3,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2
for dz=0:stp:100
   Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
for dz=100:-stp:0
   Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3
for th=0:stp:150
   Link_MyRobot(th1,dz,th,th4,th5,th6,1); 
end
for th=150:-stp:-150
   Link_MyRobot(th1,dz,th,th4,th5,th6,1); 
end

for th=-150:stp:0
    if th~=0
       Link_MyRobot(th1,dz,th,th4,th5,th6,1); 
    else
       Link_MyRobot(th1,dz,th,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint4
for th=0:stp:60
   Link_MyRobot(th1,dz,th3,th,th5,th6,1); 
end
for th=60:-stp:-240
   Link_MyRobot(th1,dz,th3,th,th5,th6,1); 
end

for th=-240:stp:0
    if th~=0
       Link_MyRobot(th1,dz,th3,th,th5,th6,1); 
    else
       Link_MyRobot(th1,dz,th3,th,th5,th6,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint5
for th=0:stp:150
   Link_MyRobot(th1,dz,th3,th4,th,th6,1); 
end
for th=150:-stp:-150
   Link_MyRobot(th1,dz,th3,th4,th,th6,1); 
end

for th=-150:stp:0
    if th~=0
       Link_MyRobot(th1,dz,th3,th4,th,th6,1); 
    else
       Link_MyRobot(th1,dz,th3,th4,th,th6,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint6
for th=0:stp:150
   Link_MyRobot(th1,dz,th3,th4,th5,th,1); 
end
for th=150:-stp:-150
   Link_MyRobot(th1,dz,th3,th4,th5,th,1); 
end

for th=-150:stp:0
    if th~=0
       Link_MyRobot(th1,dz,th3,th4,th5,th,1); 
    else
       Link_MyRobot(th1,dz,th3,th4,th5,th,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% set an initial position
for th1=0:stp:180
    Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
for th3=0:stp:150
    Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
for th4=0:stp:60
    Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
for th5=0:stp:150
    Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
for th=0:stp:150
    Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num = 1;
for th1 = 180:-60:-180
    for dz = 0:25:100
        for th3 = 150:-50:-150
            for th4 = 60:-30:-240
                for th5 = 150:-50:-150
                    for th6 = 150:-50:-150
                        Link_MyRobot(th1,dz,th3,th4,th5,th6,1);
                        x(num)=Link(7).p(1);
                        y(num)=Link(7).p(2);
                        z(num)=Link(7).p(3);
                        num=num+1;
                        plot3(x,y,z,'r*');grid;
                        hold on;
                    end                
                end          
            end
        end      
    end
end