function S=csfit(x,y,dx0,dxn)
% x,y分别为n个节点的横坐标所组成的向量及纵坐标组成的向量
% dx0,dn分别为S的导数在x0,xn处的值
n=length(x)-1;
h=diff(x);
d=diff(y)./h;
a=h(2:n-1);
b=2*(h(1:n-1)+h(2:n));
c=h(2:n);
u=6*diff(d);
b(1)=b(1)-h(1)/2;
u(1)=u(1)-3*(d(1)-dx0);
b(n-1)=b(n-1)-h(n)/2;
u(n-1)=u(n-1)-3*(dxn-d(n));
for k=2:n-1
    temp=a(k-1)/b(k-1);
    b(k)=b(k)-temp*c(k-1);
    u(k)=u(k)-temp*u(k-1);
end
m(n)=u(n-1)/b(n-1);
for k=n-2:-1:1
    m(k+1)=(u(k)-c(k)*m(k+2))/b(k);
end
m(1)=3*(d(1)-dx0)/h(1)-m(2)/2;
m(n+1)=3*(dxn-d(n))/h(n)-m(n)/2;
for k=0:n-1
    S(k+1,1)=(m(k+2)-m(k+1))/(6*h(k+1));
    S(k+1,2)=m(k+1)/2;
    S(k+1,3)=d(k+1)-h(k+1)*(2*m(k+1)+m(k+2))/6;
    S(k+1,4)=y(k+1);
end
