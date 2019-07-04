function [ A,B ] = duijiaobiaozhunxing( a,b )
%把a,b化为标准型A,B
%   此处显示详细说明
[V,D]=eig(a);
A=D;
B=V^(-1)*b;
end

