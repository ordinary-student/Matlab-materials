close all;
clear;

ToDeg=180/pi;

th1=0;
th2=0;
th3=0;

DHfk3Dof_Lnya(th1,th2,th3,0);
pause;


L1=50;
L2=100;
L3=100;

DHfk3Dof_Lnya(th1,th2,th3,0);

dtime=0.01;
stp=5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw Line on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% z plane
num=1;

for i=-50:stp:50
   x(num)=i;
   y(num)=0.1;
   z(num)=53;
   [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
   th1=th1*ToDeg;
  th2=th2*ToDeg;
  th3=th3*ToDeg;
   sh1(num)=th1;
   sh2(num)=th2;
   sh3(num)=th3;   fprintf('%2.0f %2.0f %2.0f  \n',[th1,th2,th3]');
   if(num~=1)
     qv1(num)=th1-sh1(num-1);
     qv2(num)=th2-sh2(num-1);
     qv3(num)=th3-sh3(num-1);
   end
   
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   
   figure(1);
   plot3(x,y,z,'kX'); hold on;
   DHfk3Dof_Lnya(th1,th2,th3,0);
   
%    figure(2);
%    plot(i,th1,'rx'); hold on;
%    plot(i,th2,'g+-'); hold on;
%    plot(i,th3,'yo-'); hold on;
   pause(dtime);
   if(i<199)
        cla;
   end


end
figure(3);
plot(x,sh1,'r-');hold on;
plot(x,sh2,'b-');hold on;
plot(x,sh3,'y-');hold on;

figure(4);
plot(x,qv1,'r-');hold on;
plot(x,qv2,'b-');hold on;
plot(x,qv3,'y-');hold on;


