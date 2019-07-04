function [p0,k,err,p]=fixpt(g,p0,tol,max1)
% g 是给定的迭代函数
% p0 是给定的初始值
% max1 是所允许的最大迭代次数
% k 是所进行的迭代次数加1
% p 是不动点的近似值
% err 是误差
% p(p1,p2,...,pn)
P(1)=p0;
for k=2:max1
    P(k)=feval('g',P(k-1));
    k,err=abs(P(k)-P(k-1))
p=P(k);
if(err<tol),
break; end
if k==max1
    disp('maximum number of iteration exceeded');
end
end
P