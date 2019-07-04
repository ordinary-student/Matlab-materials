% Function: draw something
% Date: 2018/04/06
clc;
clear all;

global Link
figure; 

th1=0;
dz=10;
th3=0;
th4=0;
th5=90;
th6=90;

Link_J_MyRobot(th1,dz,th3,th4,th5,th6,0); 
pause; hold off;
num=1;
for i=1:20 
Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
x(num)=Link(7).p(1);
y(num)=Link(7).p(2);
z(num)=Link(7).p(3);
num=num+1;
plot3(x,y,z,'r.');grid on;
hold on;
J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
D=det(J) ;fprintf('D= %2.4f ',D); fprintf('\n'); 
dD=[0 0 3 0 0 0]';
dth=inv(J) * dD;
th1=th1 + dth(1)/pi*180;
dz=dz + dth(2);
th3=th3 + dth(3)/pi*180;
th4=th4 + dth(4)/pi*180;
th5=th5 + dth(5)/pi*180;
th6=th6 + dth(6)/pi*180;
end
for i=1:20 
Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
x(num)=Link(7).p(1);
y(num)=Link(7).p(2);
z(num)=Link(7).p(3);
num=num+1;
plot3(x,y,z,'r.');grid on;
hold on;
J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
D=det(J) ;fprintf('D= %2.4f ',D); fprintf('\n'); 
dD=[0 3 0 0 0 0]';
dth=inv(J) * dD;
th1=th1 + dth(1)/pi*180;
dz=dz + dth(2);
th3=th3 + dth(3)/pi*180;
th4=th4 + dth(4)/pi*180;
th5=th5 + dth(5)/pi*180;
th6=th6 + dth(6)/pi*180;
end
for i=1:20 
Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
x(num)=Link(7).p(1);
y(num)=Link(7).p(2);
z(num)=Link(7).p(3);
num=num+1;
plot3(x,y,z,'r.');grid on;
hold on;
J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
D=det(J) ;fprintf('D= %2.4f ',D); fprintf('\n'); 
dD=[3 0 0 0 0 0]';
dth=inv(J) * dD;
th1=th1 + dth(1)/pi*180;
dz=dz + dth(2);
th3=th3 + dth(3)/pi*180;
th4=th4 + dth(4)/pi*180;
th5=th5 + dth(5)/pi*180;
th6=th6 + dth(6)/pi*180;
end
