close all;
clear;
ToRad = pi/180;
%%%% Part one-show Robot1
th1=0;
th2=0;
th3=0;
th4=0;
DHfk_Robot2_JC(th1,th2,th3,th4,0);
%pause;
%%%% Part two-show all joints of Robot1
%%%% Joint 1
for th1=0:10:90
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th1=90:-10:-90
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th1=-90:10:0
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
%%%% Joint 1
%%%% Joint 2
for th2=0:10:180
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th2=180:-10:-180
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th2=-180:10:0
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
%%%% Joint 2
%%%% Joint 3
for th3=0:10:180
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th3=180:-10:-180
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th3=-180:10:0
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
%%%% Joint 3
%%%% Joint 4
for th4=0:10:180
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
for th4=180:-10:0
DHfk_Robot2_JC(th1,th2,th3,th4,1);
end
%%%% Joint 4
DHfk_Robot2_JC(th1,th2,th3,th4,0);
pause;
%%%% Part three-show the workspace of Robot1
close all;
clear;
% global num
num=1;
ToRad = pi/180;
for th1=-90:30:90
    for th2=-180:30:180
        for th3=-180:30:180
            for th4=0:30:180%
                C1=cos(th1*ToRad);S1=sin(th1*ToRad);C2=cos(th2*ToRad);S2=sin(th2*ToRad);
                C3=cos(th3*ToRad);S3=sin(th3*ToRad);C4=cos(th4*ToRad);S4=sin(th4*ToRad);
                px(num)=100*S3+100*S3*S5-100*C3*C5*S4;
                py(num)=50*C1-100*C5*(C1*C4-S1*S3*S4)+100*C3*S1+100*C3*S1*S5;
                pz(num)=50*S1-100*C5*(C4*S1+C1*S3*S4)-100*C1*C3-100*C1*C3*S5;
                num=num+1;
            end
        end
    end
end
num=num-1;
plot3(px,py,pz,'r*');hold on;
th1=0;th2=0;th3=0;th4=0;
DHfk_Robot2_JC(th1,th2,th3,th4,0);
grid on;
axis([-300,300,-300,300,-300,300]);
xlabel('x');
ylabel('y');
zlabel('z');
pause;
view(90,0);%%YOZ平面，正视图
pause;
view(0,90);%%XOY平面，俯视图
pause;