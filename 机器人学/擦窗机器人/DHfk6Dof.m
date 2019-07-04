function pic=DHfk6Dof(th1,th2,th3,d4,th5,th6,fcla,fplot)
% close all
global Link

if(fcla)
    cla;
    x=[-200 -200 -200 -200];
    y=[-150 -150 150 150];
    z=[200 500 500 200];
    patch(x,y,z,'g','edgealpha',0)
    alpha(0.15);
end

Build_6DOFRobot;
radius    = 10;
len       = 20;
joint_col = 0;


plot3(0,0,0,'ro'); 

Link(2).th=th1*pi/180;
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
Link(5).dz=d4;
Link(6).th=th5*pi/180;
Link(7).th=th6*pi/180;
 
 %Link(2).th=Link(2).th+th1*pi/180;
 %Link(3).th=Link(3).th+th2*pi/180;
 %Link(4).th=Link(4).th+th3*pi/180;
 %Link(4).dy=Link(4).dy+y3;
 %Link(6).th=Link(6).th+th5*pi/180;
 %Link(7).th=Link(7).th+th6*pi/180;

p0=[0,0,0]';

for i=1:7
Matrix_DH_Ln(i);
end

for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
      if fplot
          Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
      end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Link(8).az=[sqrt(2)/2.0 0 sqrt(2)/2.0]';
 [x,y,z] = BrushCylinder(Link(7).p, Link(7).R * Link(8).az, 12);
 patch(x',y',z',joint_col*ones(size(x)));hold on;

grid on;
% view(134,12);
axis([-300,300,-300,300,0,600]);
% axis([-600,600,-600,600,-400,700]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;
end


