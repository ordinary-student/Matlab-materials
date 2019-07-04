%函数：在三维空间中绘制直线
function Connect3D(p1,p2,color,pt)
%p1：起点的坐标向量
%p2：终点的坐标向量
%color：直线的颜色
%pt：直线的线宽

%在三维空间中画直线
%plot3([直线的x坐标起点，x坐标终点]，[y坐标起点，y坐标终点]，[z坐标起点，z坐标终点]，直线的颜色)
h = plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],color);
%设置直线h的线宽pt
set(h,'LineWidth',pt)
end