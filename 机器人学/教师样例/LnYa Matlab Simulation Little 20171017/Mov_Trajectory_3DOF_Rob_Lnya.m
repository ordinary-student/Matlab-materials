close all;
clear;


ToDeg = 180/pi;
ToRad = pi/180;
L1=50;
L2=100;
L3=100;


th1=180;
th2=0;
th3=0;
DHfk3Dof_Lnya(th1,th2,th3,0);
view(134,12);
pause;
DHfk3Dof_Lnya(th1,th2,th3,1);
stp=15;

num=1;
stp=pi/12;

oth1=0;
oth2=0;
oth3=0;

r=100;
for i=0:stp:2*pi
   x(num)=60+r*cos(i);
   y(num)=60+r*sin(i);
   z(num)=80;
   [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
   if i>0
     for a=1:1:9
       sth1=(oth1+a*(oth1-th1)/10)*ToDeg;
       sth2=(oth2+a* (oth2-th2)/10)*ToDeg;
       sth3=(oth3+a* (oth3-th3)/10)*ToDeg;
       DHfk3Dof_Lnya(sth1,sth2,sth3,0);
     end 
   end
%    pause;
   oth1=th1;
   oth2=th2;
   oth3=th3;
   plot3(x,y,z,'r*'); hold on;
   th1=th1*ToDeg;
   th2=th2*ToDeg;
   th3=th3*ToDeg;
   
   if i>(pi-stp);
      DHfk3Dof_Lnya(th1,th2,th3,0);
   else
      DHfk3Dof_Lnya(th1,th2,th3,0); 
   end
end




