function yi=Hermite_wise(x,y,ydot,xi)
% Hermite分段三次插值的MATLAB实现
% 分段Hermite插值公式，其中
% x为向量，全部的插值节点；
% y为向量，插值节点处的函数值；
% ydot为向量，插值节点处的导数值，
%     如果此处值缺省，则用均差代替导数，
%     端点用向前、向后均差，中间点用中心均差；
% xi为标量，自变量x；
% yi为xi处的函数估计值；
% 如果没有给出y的导数值，则用均差代替导数。
if isempty(ydot)==1
    ydot=gradient(y,x);
end
n=length(x);m1=length(y);m2=length(ydot);
% 输入x,y和y的导数的个数必须相同.
if n~=m1|n~=m2|m1~=m2
    error('The length of X,Y and Ydot must be equal!');
    return;
end
for k=1:n-1
    % 插值节点必须互异
    if abs(x(k)-x(k+1))<eps
        error('The DATA is error!');
        return;
    end
    if x(k)<=xi&xi<=x(k+1)
        yi=y(k)*(1-2*(xi-x(k))/(x(k)-x(k+1)))...
            *(xi-x(k+1))^2/(x(k)-x(k+1))^2+...
        y(k+1)*(1-2*(xi-x(k+1))/(x(k+1)-x(k)))...
            *(xi-x(k))^2/(x(k+1)-x(k))^2+...
        ydot(k)*(xi-x(k))*(xi-x(k+1))^2/(x(k)-x(k+1))^2+...
    ydot(k+1)*(xi-x(k+1))*(xi-x(k))^2/(x(k+1)-x(k))^2;
        return;
    end
end
