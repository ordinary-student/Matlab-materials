function Lnya_DHfk3DofCyl(th1,d1,d2,fcla)
% close all

global Link

Lnya_3DOFRobotCyl;
radius    = 10;
len       = 30;
joint_col = 0;


plot3(0,0,0,'ro'); 

 Link(2).th=th1*pi/180;
 Link(2).dz=d1;
 Link(4).dz=d2;

p0=[0,0,0]';

for i=1:4
Ln_DH_Matrix(i);
end


for i=2:4
      
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
      Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
      DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
end

grid on;


