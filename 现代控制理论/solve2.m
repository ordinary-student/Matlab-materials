function [ str ] = solve2(A)
%线性时变系统齐次状态方程的解
%   输入矩阵A
%判断A矩阵是否可交换
syms t t0 t1 t2 x0 x1;
A1=subs(A,t,t1);
A2=subs(A,t,t2);
B=A1*A2;
C=A2*A1;
result=isequal(B,C);
if result==1
    N=int(A,t,x0,x1);
    N1=subs(N,x0,t0);
    M=subs(N1,x1,t)
    str='e^M*x(t0)';
else
   str='不可交换';
end
end

