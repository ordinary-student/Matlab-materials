% Function: draw GDUT badge
% Date: 2018/04/06
clc;

%%%%%%%%%%%%%
Img = imread('555.png');
GDUTImg = imresize(im2bw(Img),0.3);
GDUTImg = ~GDUTImg;
GDUTImg = flipud(GDUTImg);
[col, row] = size(GDUTImg);
%%%%%%%%%%%%%
global Link
figure; 

th1 = 150;
dz = 50;
th3 = 60;
th4 = -60;
th5 = 90;
th6 = 90;

Link_J_MyRobot(th1,dz,th3,th4,th5,th6,0); 
%pause; 
hold off;
num=1;
x=[];
y=[];
z=[];
for i=1:1:col
    th1 = 150;
    dz = 50;
    th3 = 60;
    th4 = -60;
    th5 = 90;
    th6 = 90;
    for k=1:1:i
        Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
        J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
        D=det(J) ;
%         fprintf('D= %2.4f ',D); fprintf('\n'); 
        dD=[0 0 1 0 0 0]';
        dth=J\dD;
        th1=th1 + dth(1)/pi*180;
        dz=dz + dth(2);
        th3=th3 + dth(3)/pi*180;
        th4=th4 + dth(4)/pi*180;
        th5=th5 + dth(5)/pi*180;
        th6=th6 + dth(6)/pi*180;
        if ~isempty(x)
            %plot3(x,y,z,'r.');grid on;
            hold on;
        end
    end
    
    
    for j=1:1:row
        Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
        if GDUTImg(i, j) ==  1
            x(num)=Link(7).p(1);
            y(num)=Link(7).p(2);
            z(num)=Link(7).p(3);
            num=num+1;
           % plot3(x,y,z,'r.');grid on;
            hold on;
        end
        if ~isempty(x)
            plot3(x,y,z,'r.');grid on;
            hold on;
        end
        J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
        D=det(J) ;
%         fprintf('D= %2.4f ',D); fprintf('\n'); 
        dD=[1 0 0 0 0 0]';
        dth=J\dD;
        th1=th1 + dth(1)/pi*180;
        dz=dz + dth(2);
        th3=th3 + dth(3)/pi*180;
        th4=th4 + dth(4)/pi*180;
        th5=th5 + dth(5)/pi*180;
        th6=th6 + dth(6)/pi*180;
    end
    %pause
end
figure;
plot3(x,y,z,'r.');grid on;
hold on;
