function [str]= nengkong(A,B)
% 输入系数矩阵，输出结果字符串
%x'=A*x+B*u;y=C*x
%判断是否能控
r=rank(A);
X=B;
U=B;
for i=1:r-1
    X=A*X;
    U=[U,X];
end
r2=rank(U);
if r2==r
    str='能控';
else
     str='不能控';
end
end