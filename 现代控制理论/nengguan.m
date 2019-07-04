function [str]= nengguan(A,C)
% 输入系数矩阵，输出结果字符串
%x'=A*x+B*u;y=C*x
%判断是否能观
r=rank(A);
X=C;
U=C;
for i=1:r-1
    X=X*A;
    U=[U;X];
end
r2=rank(U);
if r2==r
    str='能观';
else
     str='不能观';
end
end
