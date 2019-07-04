close all;
% A(1:90)=struct('cdata',[],'colormap',[]);
clear;


% Lnya_3DOFRobot;
figure; 
set (gcf,'Position',[400,100,1000,900])
% fprintf('Link2 alf: %f', Link(2).alf); pause;

axis([-200,200,-200,200,-200,200]);    %set range of axis
xlabel('x');
ylabel('y'); set(gca,'ydir','reverse');
zlabel('z');%set(gca,'zdir','reverse');

L1=50;
L2=100;
L3=200;



x=200; y=200; z=100; [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x,y,z); fprintf('%f,%f,%f \n', th1,th2,th3);   % Inverse Kinematics
Lnya_DHfk3Dof(th1,th2,th3,0); plot3(x,y,z,'bx');   axis([-300,300,-300,300,-300,300]);
xlabel('x');
ylabel('y'); set(gca,'ydir','reverse');
zlabel('z');
drawnow;
pause;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw Rectangle

num=1;
for i=100:-5:-100 
   x(num)=100;
   y(num)=i;
   z(num)=100;
   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num)); fprintf('%f,%f,%f \n', th1,th2,th3);
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'bX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0); 
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');
   drawnow;
   pause(0.0001);
   cla; 
end




for i=100:-5:-100
   x(num)=i;
   y(num)=-100;
   z(num)=100;
   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'bX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);   %draw 3Joint robot
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   cla; 
end

for i=-100:5:100
   x(num)=-100;
   y(num)=i;
   z(num)=100;
   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'bX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   cla; 
end


for i=-100:5:100
   x(num)=i;
   y(num)=100;
   z(num)=100;
   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'bX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   if(i<100)
       cla;
   end
       
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw Circle on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% z plane
num=1;

for i=-100:5:100
   x(num)=i;
   y(num)=(100^2-x(num)^2)^0.5;
   z(num)=100;
   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'kX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   if(i<100)
       cla;
   end

end

for i=100:-5:-100
   x(num)=i;
   y(num)=-(100^2-x(num)^2)^0.5;
   z(num)=100;
   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'kX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   if(i>-100)
       cla;
   end
end

num=1;
for i=0:1:100
   x(num)=200;
   z(num)=i;
   y(num)=50+(50^2-(z(num)-50)^2)^0.5;

   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'kX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   if(i<100)
       cla;
   end
end

for i=100:-1:0
   x(num)=200;
   z(num)=i;
   y(num)=50-(50^2-(z(num)-50)^2)^0.5;

   [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x(num),y(num),z(num));
   num=num+1;
%    if(i==100)
%        Lnya_DHfk3Dof(th1,th2,th3,0);
%    else
   plot3(x,y,z,'kX'); hold on;
   Lnya_DHfk3Dof(th1,th2,th3,0);
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.0001);
   if(i>0)
       cla;
   end

end

