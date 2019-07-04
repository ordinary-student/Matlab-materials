function DrawRobot(Link,fcla)
radius    = 15;
len       = 30;
joint_col = 0;
last_arm = length(Link);
for i=2:last_arm
    Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
    plot3(Link(i).p(1),Link(i).p(2),Link(i).p(3),'rx');hold on;
    if i<=last_arm
      DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_col); hold on;
    end 
end
view(140,40);
% set (gcf,'Position',[650,100,700,600])
axis([-500,500,-500,500,-500,500]);
xlabel('x');
ylabel('y'); 
zlabel('z');
grid on;
drawnow;
if(fcla)
    cla;
end