close all;
clear;
global Link
num=1;
ToRad = pi/180;
for th1=-180:30:180
    for th2=0:30:180
        for th3=-90:30:90
            for th4=0:30:180
                % %描点法% %
%                 DHfk_Robot3_JC(th1,th2,th3,th4,1);
%                 px(num)=Link(5).p(1);py(num)=Link(5).p(2);pz(num)=Link(5).p(3);
%                 plot3(px,py,pz,'r*');hold on;
                % %描点法% %
                C1=cos(th1*ToRad);S1=sin(th1*ToRad);C2=cos(th2*ToRad);S2=sin(th2*ToRad);
                C3=cos(th3*ToRad);S3=sin(th3*ToRad);C4=cos(th4*ToRad);S4=sin(th4*ToRad);
                px(num)=100*S4*(C1*S3-C3*S1*S2)-50*S1*S2-50*S1+50*C1*S3+100*C2*C4*S1-50*C3*S1*S2;
                py(num)=50*C1+50*S1*S3+100*S4*(S1*S3+C1*C3*S2)+50*C1*S2-100*C1*C2*C4+50*C1*C3*S2;
                pz(num)=-50*C2-50*C2*C3-100*C4*S2-100*C2*C3*S4;
                num=num+1;
            end
        end
    end
end
num=num-1;
plot3(px,py,pz,'r*');hold on;
th1=0;th2=0;th3=0;th4=0;
DHfk_Robot3_JC(th1,th2,th3,th4,0);
grid on;
axis([-300,300,-300,300,-300,300]);
xlabel('x');
ylabel('y');
zlabel('z');