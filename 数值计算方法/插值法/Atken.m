function f = Atken(x,y,x0)
%求已知数据点的埃特金插值多项式
%已知数据点的x坐标向量：x
%已知数据点的y坐标向量：y
%插值的x坐标：x0
%求得的埃特金插值多项式或在x0处的插值：f
syms t;
if(length(x) == length(y))
    n = length(x);    
else
    disp('x和y的维数不相等！');
    return;
end                                      %检错
y1(1:n) = t;                             %符号函数数组要赋初值
for(i=1:n-1)   
    for(j=i+1:n)
        y1(j) = y(j)*(t-x(i))/(x(j)-x(i))+y(i)*(t-x(j))/(x(i)-x(j));    
    end
    y = y1;
    simplify(y1);
end
if(nargin == 3)
    f = subs(y1(n),'t',x0);            %计算插值点的函数值
else
    simplify(y1(n));                   %化简
    f = collect(y1(n));                %将插值多项式展开
    f = vpa(f,6);                      %将插值多项式的系数化成6位精度的小数
end
