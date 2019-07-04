function pic=DHfk_Robot2_JC(th1,th2,th3,th4,fcla)
global Link
Build_Robot2_JC;
radius    = 10;
len       = 20;
joint_col = 0;
Link(2).th= Link(2).th+th1*pi/180;
Link(4).th=Link(4).th+th2*pi/180;
Link(5).th=Link(5).th+th3*pi/180;
Link(6).th=Link(6).th+th4*pi/180;
for i=1:6
    Matrix_DH_Ln(i);
end
for i=2:6
    Link(i).A=Link(i-1).A*Link(i).A;
    Link(i).p= Link(i).A(:,4);
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
    Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
    if i==2
        DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
    end
    if i>3
        DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
    end
end
grid on;
view(134,12);
axis([-300,300,-300,300,-300,300]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;
pic=getframe;
if(fcla)
    cla;
end