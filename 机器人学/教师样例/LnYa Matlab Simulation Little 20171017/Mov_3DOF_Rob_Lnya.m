close all;
clear;


ToDeg = 180/pi;
ToRad = pi/180;
L1=50;
L2=100;
L3=100;


th1=90;
th2=0;
th3=0;
DHfk3Dof_Lnya(th1,th2,th3,0);
view(134,12);
pause;
stp=30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for i=0:stp:180
   DHfk3Dof_Lnya(th1+i,th2,th3,1); 
end
for i=180:-stp:0
    if i==0
      DHfk3Dof_Lnya(th1+i,th2,th3,0);  
    else
      DHfk3Dof_Lnya(th1+i,th2,th3,1);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2


for i=0:stp:180
   DHfk3Dof_Lnya(th1,th2+i,th3,1); 
end
for i=180:-stp:0
    if i==0
      DHfk3Dof_Lnya(th1,th2+i,th3,0);  
    else
      DHfk3Dof_Lnya(th1,th2+i,th3,1); 
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3


for i=0:stp:180
  DHfk3Dof_Lnya(th1,th2,th3+i,1); 
end
for i=180:-stp:0
    if i==0
      DHfk3Dof_Lnya(th1,th2,th3+i,0);  
    else
      DHfk3Dof_Lnya(th1,th2,th3+i,1); 
    end 
end

pause;
cla;
px=50; py=0; pz=50;

[th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,px,py,pz);
th1=th1*ToDeg;
th2=th2*ToDeg;
th3=th3*ToDeg;

DHfk3Dof_Lnya(th1,th2,th3,0); 
plot3(px,py,pz,'r*');
pause;

% L1=50;
% L2=100;
% L3=120;
% x=-100;
% y=120;
% z=50;
% 
% [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x,y,z);
% Lnya_DHfk3Dof(th1,th2,th3,0);
% axis([-300,300,-300,300,-300,300]);
% plot3(x,y,z,'rX');hold on;
% xlabel('x');
% ylabel('y'); set(gca,'ydir','reverse');
% zlabel('z'); hold on;
% 
% 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw Circle on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% z plane
num=1;

% for i=-150:5:150
%    x(num)=i;
%    y(num)=(150^2-x(num)^2)^0.5;
%    z(num)=100;
%    [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
%    num=num+1;
% th1=th1*ToDeg;
% th2=th2*ToDeg;
% th3=th3*ToDeg;
%    plot3(x,y,z,'kX'); hold on;
%    DHfk3Dof_Lnya(th1,th2,th3,1);
% 
% end
% for i=150:-5:-150
%    x(num)=i;
%    y(num)=-(150^2-x(num)^2)^0.5;
%    z(num)=100;
%    [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
%    num=num+1;
% th1=th1*ToDeg;
% th2=th2*ToDeg;
% th3=th3*ToDeg;
%    plot3(x,y,z,'kX'); hold on;
%    if i==-150
%      DHfk3Dof_Lnya(th1,th2,th3,0);
%    else
%      DHfk3Dof_Lnya(th1,th2,th3,1);
%    end
% end
% 
% 
% num=150;
% aviobj=avifile('D:\3DofRob.avi','fps',30);
r=80;
for i=-pi:0.1:pi
   x(num)=r*cos(i);
   y(num)=r*sin(i);
   z(num)=60;
   [th1,th2,th3]=IK_3DOF_Rob_Lnya(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
   th1=th1*ToDeg;
   th2=th2*ToDeg;
   th3=th3*ToDeg;
   plot3(x,y,z,'kX'); hold on;
   if i>(pi-0.05);
      Movie=DHfk3Dof_Lnya(th1,th2,th3,0);
   else
      Movie=DHfk3Dof_Lnya(th1,th2,th3,1); 
   end
%    aviobj = addframe(aviobj,Movie);
end
% aviobj = close(aviobj);





% for i=150:-5:-150
%    x(num)=i;
%    y(num)=-(150^2-x(num)^2)^0.5;
%    z(num)=100;
%    [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
%    num=num+1;
% %    if(i==100)
% %        Lnya_DHfk3Dof(th1,th2,th3,0);
% %    else
%    plot3(x,y,z,'kX'); hold on;
%    Lnya_DHfk3Dof(th1,th2,th3,0);
%    axis([-200,200,-200,200,-200,200]);
%    xlabel('x');
%    ylabel('y'); set(gca,'ydir','reverse');
%    zlabel('z');%set(gca,'zdir','reverse');
%    drawnow;
%    pause(0.0001);
%    if(i>-150)
%        cla;
%    end
% end
% 
% num=1;
% for i=0:1:100
%    x(num)=150;
%    z(num)=i;
%    y(num)=50+(50^2-(z(num)-50)^2)^0.5;
% 
%    [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
%    num=num+1;
% %    if(i==100)
% %        Lnya_DHfk3Dof(th1,th2,th3,0);
% %    else
%    plot3(x,y,z,'kX'); hold on;
%    Lnya_DHfk3Dof(th1,th2,th3,0);
%    axis([-200,200,-200,200,-200,200]);
%    xlabel('x');
%    ylabel('y'); set(gca,'ydir','reverse');
%    zlabel('z');%set(gca,'zdir','reverse');
%    drawnow;
%    pause(0.0001);
%    if(i<100)
%        cla;
%    end
% end
% 
% for i=100:-1:0
%    x(num)=150;
%    z(num)=i;
%    y(num)=50-(50^2-(z(num)-50)^2)^0.5;
% 
%    [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
%    num=num+1;
% %    if(i==100)
% %        Lnya_DHfk3Dof(th1,th2,th3,0);
% %    else
%    plot3(x,y,z,'kX'); hold on;
%    Lnya_DHfk3Dof(th1,th2,th3,0);
%    axis([-200,200,-200,200,-200,200]);
%    xlabel('x');
%    ylabel('y'); set(gca,'ydir','reverse');
%    zlabel('z');%set(gca,'zdir','reverse');
%    drawnow;
%    pause(0.0001);
%    if(i>0)
%        cla;
%    end
% 
% end
% 
% 
