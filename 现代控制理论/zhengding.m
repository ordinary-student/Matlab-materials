function [str] = zhengding( v )
% 输入系数矩阵，输出结果字符串
%v是多项式系数向量
%判断是否正定
V=[v(1,1),v(1,4)/2,v(1,6)/2;v(1,4)/2,v(1,2),v(1,5)/2;v(1,6)/2,v(1,5)/2,v(1,3)];
p1=det(V(1,1));
p2=det([V(1,1),V(1,2);V(2,1),V(2,2)]);
p3=det(V);
Z=-V;
p4=det(Z(1,1));
p5=det([Z(1,1),Z(1,2);Z(2,1),Z(2,2)]);
p6=det(Z);
if p1==0||p2==0||p3==0
     str='半正定';
elseif p1>0&&p2>0&&p3>0
     str='正定';
elseif p4>0&&p5>0&&p6>0
     str='负定';
else
     str='非正定';
end
end

