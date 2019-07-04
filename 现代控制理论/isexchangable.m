function [ str ] = isexchangable(A)
%ISEXCHANGABLE 判断A矩阵是否可交换
%   输入矩阵A和自变量t
syms t t1 t2;
A1=subs(A,t,t1);
A2=subs(A,t,t2);
B=A1*A2;
C=A2*A1;
result=isequal(B,C);
if result==1
    str='可交换';
else
   str='不可交换';
end

