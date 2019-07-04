%函数：画工作空间
function pic=DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6,fcla,fplot)
%th1-th6：关节角
%fcla：是否擦除
%fplot：是否绘制

% 全局坐标Link
global Link
%导入模型
Build_6DOFRobot;
radius    = 10;%半径
len       =   20;%高度
joint_color = 0;%关节颜色

ToRad = pi/180;%转为弧度

plot3(0,0,0,'ro');%画原点

Link(2).th=th1*ToRad;
Link(3).th=th2*ToRad;
Link(4).th=th3*ToRad;
Link(5).dz=d4;
Link(6).th=th5*ToRad;
Link(7).th=th6*ToRad;

%Link(2).th=Link(2).th+th1*pi/180;
%Link(3).th=Link(3).th+th2*pi/180;
%Link(4).th=Link(4).th+th3*pi/180;
%Link(4).dy=Link(4).dy+y3;
%Link(6).th=Link(6).th+th5*pi/180;
%Link(7).th=Link(7).th+th6*pi/180;

%p0=[0,0,0]';

for i=1:7
    Matrix_DH_Ln(i);%计算DH参数矩阵
end

for i=2:7
    Link(i).A=Link(i-1).A*Link(i).A;%累乘，总变换
    Link(i).n= Link(i).A(:,1);
    Link(i).o= Link(i).A(:,2);
    Link(i).a= Link(i).A(:,3);
    Link(i).p= Link(i).A(:,4);
    Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];%3*3
    if (fplot)
        %绘制连杆-直线
        Connect3D(Link(i-1).p,Link(i).p,'b',2); hold on;
        %绘制关节-圆柱
        DrawCylinder(Link(i-1).p, Link(i-1).R * Link(i).az, radius,len, joint_color); 
        hold on;
    end
end

grid on;
%view(134,12);
%坐标范围限制
axis([-600,600,-600,600,-400,700]);
xlabel('x');
ylabel('y');
zlabel('z');
drawnow;%更新图像窗口
pic=getframe;%捕获坐标区内容并返回图像数据

%擦除
if(fcla)
    cla;
end
end


