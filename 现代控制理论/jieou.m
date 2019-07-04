function [ str ] = jieou( A,B,C )
% 输入系数矩阵，输出结果字符串
%x'=A*x+B*u;y=C*x
%判断能否用状态反馈实现解耦控制
 I=eye(3);%单位矩阵
 syms x;%定义x
G=C*((x*I-A)^(-1))*B; %传递函数矩阵
[num1,den1]=numden(G(1,1));%返回分子分母多项式
[num2,den2]=numden(G(1,2));
[num3,den3]=numden(G(2,1));
[num4,den4]=numden(G(2,2));
N1=sym2poly(num1);%多项式转为系数向量
N2=sym2poly(num2);
N3=sym2poly(num3);
N4=sym2poly(num4);
D1=sym2poly(den1);
D2=sym2poly(den2);
D3=sym2poly(den3);
D4=sym2poly(den4);
fenzi1=size(N1);%求行数、列数
fenzi2=size(N2);
fenzi3=size(N3);
fenzi4=size(N4);
fenmu1=size(D1);
fenmu2=size(D2);
fenmu3=size(D3);
fenmu4=size(D4);
d11=fenmu1(1,2)-fenzi1(1,2);%求最高次数之差
d12=fenmu2(1,2)-fenzi2(1,2);
d21=fenmu3(1,2)-fenzi3(1,2);
d22=fenmu4(1,2)-fenzi4(1,2);
d1=min(d11,d12)-1;%求d
d2=min(d21,d22)-1;
%d个s乘上G
xg1=(x^(d1+1))*G(1,:);
xg2=(x^(d2+1))*G(2,:);  
E1=limit(xg1,x,inf);%求极限
E2=limit(xg2,x,inf);
E=[E1;E2];
zhi=det(E);
if zhi~=0
    str='能用状态反馈实现解耦控制';
else
    str='不能用状态反馈实现解耦控制';
end
end

