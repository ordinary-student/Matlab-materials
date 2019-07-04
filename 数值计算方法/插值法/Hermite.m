function yy=hermite(x0,y0,y1,x)
%hermite插值，求数据(x0,y0)所表达的函数，以及y1所表达的导数值，在插值点x处的插值
n=length(x0);
m=length(x);
for k=1:m
    yy0=0;
    for i=1:n
        h=1;
        a=0;
        for j=1:n
            if j~=i
                h=h*((x(k)-x0(j))/(x0(i)-x0(j)))^2;
                a=1/(x0(i)-x0(j))+a;
            end 
        end
        yy0=yy0+h*((x0(i)-x(k))*(2*a*y0(i)-y1(i))+y0(i));
    end 
    yy(k)=yy0;
end
