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

% th1=45;
% d1=200;
% d2=300;

x=-100; y=200; z=100; [th1,d1,d2]=Ln_IK3DOFCyl(x,y,z); fprintf('%f,%f,%f \n', th1,d1,d2);   % Inverse Kinematics
Lnya_DHfk3DofCyl(th1-90,d1,d2,0); 
%plot3(x,y,z,'bx');  
axis([-300,300,-300,300,-300,300]);
xlabel('x');
ylabel('y'); set(gca,'ydir','reverse');
zlabel('z');

drawnow;
pause;
cla;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

num=1;
for i=50:10:150
   x(num)=100;
   z(num)=i;
   y(num)=100+(50^2-(z(num)-100)^2)^0.5;

   [th1,d1,d2]=Ln_IK3DOFCyl(x(num),y(num),z(num)); 
   num=num+1;

   plot3(x,y,z,'kX'); hold on;
   Lnya_DHfk3DofCyl(th1-90,d1,d2,0); 
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.1);
   if(i<150)
       %cla;
   end
end

for i=150:-10:50
   x(num)=100;
   z(num)=i;
   y(num)=100-(50^2-(z(num)-100)^2)^0.5;

   [th1,d1,d2]=Ln_IK3DOFCyl(x(num),y(num),z(num)); 
   num=num+1;

   plot3(x,y,z,'kX'); hold on;
   Lnya_DHfk3DofCyl(th1-90,d1,d2,1); 
   axis([-200,200,-200,200,-200,200]);
   xlabel('x');
   ylabel('y'); set(gca,'ydir','reverse');
   zlabel('z');%set(gca,'zdir','reverse');
   drawnow;
   pause(0.1);
   if(i>50)
       %cla;
   end

end


