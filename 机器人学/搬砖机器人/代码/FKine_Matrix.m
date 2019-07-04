%正运动学齐次变换矩阵
function [ result ] = FKine_Matrix( zeta,d,a,alf )

result=[cos(zeta)  -sin(zeta)*cos(alf)  sin(zeta)*sin(alf)  a*cos(zeta);
       sin(zeta)   cos(zeta)*cos(alf)    -cos(zeta)*sin(alf)  a*sin(zeta);
       0          sin(alf)             cos(alf)             d;
       0           0                    0                  1];

end

