function [ str ] = kelasuofu(dx1,dx2,x1,x2)
%KRASOVSKI 克拉索夫斯基方法判断稳定性
%输入x1'，x2'的表达式和x1,x2
fx=[dx1;dx2];
%求导
Fx=[diff(dx1,x1),diff(dx1,x2);diff(dx2,x1),diff(dx2,x2)];
Fx2=Fx';%共轭转置
%disp('----------矩阵----------');
FX=simplify((Fx2+Fx));
FX2=subs(FX,x1,1);%赋值
FX3=subs(FX2,x2,1);
Z=-FX3;
p4=det(Z(1,1));
p5=det([Z(1,1),Z(1,2);Z(2,1),Z(2,2)]);
p6=det(Z);
temp=0;
if p4>0&&p5>0&&p6>0
     temp=1;
     str='渐近稳定';
else
     str='不稳定';
end
%判断是否大范围渐近稳定
fx2=fx';
fx3=fx2*fx;
result=limit(limit(fx3,x1,inf),x2,inf);
if temp==1&&result==inf
    str='大范围渐近稳定';
end
end

