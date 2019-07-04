%函数：绘制抓手
function [x2,y2,z2] = BrushCylinder(pos, az, radius)
% draw closed cylinder
%刷子圆柱的中心点坐标，z轴单位向量，半径
%******** rotation matrix
az0 = [0;0;1];
ax  = cross(az0,az);
ax_n = norm(ax);
if ax_n < eps 
	rot = eye(3);
else
    ax = ax/ax_n;
    ay = cross(az,ax);
    ay = ay/norm(ay);
    rot = [ax ay az];
end

%********** make cylinder
% col = [0 0.5 0];  % cylinder color

a = 20;    % number of side faces
theta = (0:a)/a * 2*pi;

x = [radius] * cos(theta);
y = [radius] * sin(theta);
z = zeros(1,a+1);

xyz = [x;y;z];
xyz2 = rot * xyz;
x2 = xyz2(1,:);
y2 = xyz2(2,:);
z2 = xyz2(3,:);

%************* draw
% side faces
x2 = x2+pos(1);
y2 = y2+pos(2);
z2 = z2+pos(3);
end