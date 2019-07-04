%函数：绘制封闭的三维圆柱体
function h = DrawCylinder(pos, az, radius,len, color)
% draw closed cylinder
%圆柱中心坐标pos, z轴单位向量az, 半径radius,高度len, 颜色color
%旋转矩阵rotation matrix

az0 = [0;0;1];%z轴单位向量

%求向量叉积，返回的ax同时垂直于az0,az
ax  = cross(az0,az);
%求向量的模
ax_n = norm(ax);

if ax_n < eps 
	rot = eye(3);%单位矩阵
else
    ax = ax/ax_n;%单位向量=向量/模长
    ay = cross(az,ax);
    ay = ay/norm(ay);%单位向量
    rot = [ax ay az];%单位向量矩阵
end

%********** make cylinder
% col = [0 0.5 0];  % cylinder color圆柱的颜色

a = 20;    % number of side faces圆柱的侧面的数量
theta = (0:a)/a * 2*pi;%角度向量，把360度分成20份
%theta=0.1pi, 0.2pi, 0.3pi, ..., 2pi

%x,y,z都是2行21列的矩阵
x = [radius; radius]* cos(theta);
y = [radius; radius] * sin(theta);
z = [len/2; -len/2] * ones(1,a+1);
%颜色矩阵
color_matrix = color*ones(size(x));

%size(x,1)返回x的第1个维度的长度，n=1:2
for n=1:size(x,1)
   xyz = [x(n,:);y(n,:);z(n,:)];
   xyz2 = rot * xyz;
   x2(n,:) = xyz2(1,:);
   y2(n,:) = xyz2(2,:);
   z2(n,:) = xyz2(3,:);
   %x2,y2,z2都是2*21的矩阵
end

%************* draw
% side faces创建三维曲面图
h = surf(x2+pos(1),y2+pos(2),z2+pos(3),color_matrix);

%创建并填充多边形
for n=1:2
	patch(x2(n,:)+pos(1),y2(n,:)+pos(2),z2(n,:)+pos(3),color_matrix(n,:));
end	
end