% Function: Link my robot
% Date: 2018/04/06
function Link_J_MyRobot(th1,dz,th3,th4,th5,th6,fcla)
global Link

Build_MyRobot;
radius    = 25;  %25
len       = 60;  %60
joint_col = 0;


%plot3(0,0,0,'ro'); 
 Link(2).th= th1*pi/180;
 Link(3).dz=dz+100;
 Link(4).th=th3*pi/180;
 Link(5).th=th4*pi/180;
 Link(6).th=th5*pi/180;
 Link(7).th=th6*pi/180;

% Link(2).th= Link(2).th+th1*pi/180;
% Link(3).dz=Link(3).dz+dz;
% Link(4).th=Link(4).th+th3*pi/180;
% Link(5).th=Link(5).th+th4*pi/180;
% Link(6).th=Link(6).th+th5*pi/180;
% Link(7).th=Link(7).th+th6*pi/180;    %for initial position

% if (Link(3).dz < 100) 
%     error = 'dz < 0, out of range !'
%     pause;
% elseif (Link(3).dz > 200)
%     error = 'dz > 100, out of range !'
%     pause;
% elseif (Link(4).th < -150*pi/180) || (Link(4).th > 150*pi/180)
%     error = 'th3 out of range'
%     pause;
% elseif (Link(5).th < -240*pi/180) || (Link(5).th > 60*pi/180)
%     error = 'th4 out of range'
%     pause;
% elseif (Link(6).th < -150*pi/180) || (Link(6).th > 150*pi/180)
%     error = 'th5 out of range'
%     pause;
% elseif (Link(7).th < -150*pi/180) || (Link(7).th > 150*pi/180)
%     error = 'th6 out of range'
%     pause;
% end

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
      Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
       plot3(Link(i).p(1),Link(i).p(2),Link(i).p(3),'rx');hold on;
      if i<=7
          DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
      end 
end
%view(125,52);
%set (gcf,'Position',[650,100,700,600])
axis([-550,550,-550,550,-300,550]);
xlabel('x');
ylabel('y'); 
zlabel('z');
grid on;
drawnow;
if(fcla)
    cla;
end