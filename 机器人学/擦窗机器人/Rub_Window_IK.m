close all;
clear;

global Link

ToDeg = 180/pi;
ToRad = pi/180;

th1=0;
th2=-135;
th3=-90;
d4=30;
th5=90;
th6=135;
figure(1);
DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);
view(134,12);
DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);

%pause;

% given trace给定轨迹
%1 is rub five-pointed star track; 0 is cos track.
%1是五角星轨迹，0是cos轨迹
track=1;
if (track) 
    p = [0 0 92 1; 0 20 21 1; 0 96 21 1;0 36 -21 1; 0 58 -91 1;
        0 0 -47 1;0 -58 -91 1;0 -36 -21 1;0 -96 21 1;0 -20 21 1;0 0 92 1];
else
    z=4*pi:-pi/2:-4*pi;
    y=cos(z)*80;
    z=z*80/(4*pi);
    x=zeros(size(z));
    n=ones(size(z));
    p=[x;y;z;n]';
end
centre_point=[-200,0,345,1];
for i=1:4
    p(:,i)=p(:,i)+centre_point(i);
end

%how many point between two adjacent ponit
point_num=10; %相连关节间的距离

point1=[];
point2=[];
point3=[];
num=1;

% target pose目标姿态
target_z = [-sqrt(2)/2.0 0 sqrt(2)/2.0 0]';
Target.A = Link(7).A;
det = target_z - Link(7).A(:,1);
for i=1:5
    Target.A = Link(7).A;
    Target.A(:,1) = Link(7).A(:,1) + det*1/5;
    [th1,th2,th3,d4,th5,th6] = Move_IK(th1,th2,th3,d4,th5,th6,Target);
    figure(1);
    DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);
end

% rub wondow擦窗
for i=1:size(p,1)
    det = p(i,:)' - Link(7).A(:,4);
    if i==1
        N=10;
    else
        N=point_num;
    end
    for j=1:N
        Target.A = Link(7).A;
        Target.A(:,1)=target_z;
        Target.A(:,4) = Link(7).A(:,4) + det*1/N;
        [th1,th2,th3,d4,th5,th6] = Move_IK(th1,th2,th3,d4,th5,th6,Target);
        figure(1);
        DHfk6Dof(th1,th2,th3,d4,th5,th6,1,1);
        if i>1
            [x,y,z] = BrushCylinder(Link(7).p, Link(7).R * Link(8).az, 12);
            point1=[point1;x];
            point2=[point2;y];
            point3=[point3;z];
            patch(point1',point2',point3','r','edgealpha',0);hold on;
            num=num+1;
        end
    end
end
DHfk6Dof(th1,th2,th3,d4,th5,th6,0,1);