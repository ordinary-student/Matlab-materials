function [ str ] = Krasovski(dx1,dx2,x1,x2)
%KRASOVSKI 克拉索夫斯基方法判断稳定性
%输入x1'，x2'的表达式和x1,x2
fx=[dx1;dx2];
%求导
Fx=[diff(dx1,x1),diff(dx1,x2);diff(dx2,x1),diff(dx2,x2)];
Fx2=Fx';%共轭转置
disp('----------矩阵----------');
FX=simplify((Fx2+Fx))
disp('----------行列式的值----------');
DET=det(FX)
fx2=fx';
fx3=fx2*fx;
result=limit(limit(fx3,x1,inf),x2,inf);
if result==inf
    str='大范围渐近稳定';
end
end

