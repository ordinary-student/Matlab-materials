function Connect3D(p1,p2,option,pt)        
%这是连接两个关节成一条杆的函数，Link(i).p表示第i个关节的空间位置。
h = plot3([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],option);    
%画p1点到p2点的直线，p1,p2两点都是四行一列的矩阵，不过这里取前三行的值。option是线条颜色值。
set(h,'LineWidth',pt)    %这里pt为线宽，即机器人杆的宽度。
end