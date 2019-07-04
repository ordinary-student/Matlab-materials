function [ K2 ] = peizhijidian( A,B,C )
%PEIZHIJIDIAN 单输入系统极点配置的算法
%   输入系数矩阵A，B；x'=A*x+B*u
%C为配置后的极点向量
%判断是否能控
r=3;
X=B;
Q=B;
for i=1:r-1
    X=A*X;
    Q=[Q,X];
end
r2=rank(Q);
if r2==r %能控
    syms s;
    I=eye(3);
    Z=s*I-A;
    f1=simplify(det(Z));
    f2=simplify((s-C(1,1))*(s-C(1,2))*(s-C(1,3)));
    F1=sym2poly(f1);
    F2=sym2poly(f2);
    K=[F2(1,4)-F1(1,4),F2(1,3)-F1(1,3),F2(1,2)-F1(1,2)];
    U=[F1(1,3),F1(1,2),1;F1(1,2),1,0;1,0,0];
    Q2=Q*U;
    P=inv(Q2);
    K2=K*P;
else %不能控
     K2='不能控';
end
end

