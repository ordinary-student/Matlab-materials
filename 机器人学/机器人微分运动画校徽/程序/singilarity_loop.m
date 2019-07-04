% Function: get singilarity
% Date: 2018/04/06
clc;
clear all;
figure; 

th1=0;
dz=0;
th3=0;
th4=0;
th5=0;
th6=0;
Link_J_MyRobot(th1,dz,th3,th4,th5,th6,0); 
pause; hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% set an initial position
% stp=10;
% for th1=0:stp:180
%     Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
% end
% for th3=0:stp:150
%     Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
% end
% for th4=0:stp:60
%     Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
% end
% for th5=0:stp:150
%     Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
% end
% for th=0:stp:150
%     Link_MyRobot(th1,dz,th3,th4,th5,th6,1); 
% end
%%%%%%%%%%%%%%%%
num=1;
D = [];
th_1=[];
dz_2=[];
th_3=[];
th_4=[];
th_5=[];
th_6=[];
for th1 = 180:-60:-180
    for dz = 0:25:100
        for th3 = 150:-40:-150
            for th4 = 60:-50:-240
                for th5 = 150:-50:-150
                    for th6 = 150:-50:-150
                           Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
                           J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
                           d=det(J);%fprintf('D= %2.4f ',D); fprintf('\n'); 
                           if d>=-0.000000001 & d <=0.000000001
                              D(num) = d;
                              th_1(num)=th1;
                              dz_2(num)=dz;
                              th_3(num)=th3;
                              th_4(num)=th4;
                              th_5(num)=th5;
                              th_6(num)=th6;
                              num = num + 1;
                           end
                    end                
                end          
            end
        end      
    end
end







