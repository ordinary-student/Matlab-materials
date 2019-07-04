function pic = Move_Robot( th1,distance,th3,fcla )
%机器人正运动

global Link

zq_3dof_robot;
radius = 15;
len = 30;
joint_col = 0;

plot3(0,0,0,'ro');
%绘制基座
plotcube([60 60 20],[-30 -30 -35],1,[0.22,0.73,0.62]);

Link(2).th=th1*pi/180;
Link(3).dz=distance;
Link(4).th=th3*pi/180;

p0=[0,0,0]';

for i=1:4
    Matrix_DH_Ln(i);
end

for i=2:4
    Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
    Connect3D(Link(i-1).p,Link(i).p,'b',2); 
    hold on;
    DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az,radius,len, joint_col); 
    hold on;
end


% %画抓手
% Link(4).az=[1,0,0]';
% [x,y,z] = BrushCylinder(Link(4).p, Link(4).R * Link(4).az, 15);
% patch(x',y',z',joint_col*ones(size(x)));
% hold on;

grid on;
% view(134,12);
axis([-300,300,-300,300,-100,300]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;
if(fcla)
    cla;
end

end

