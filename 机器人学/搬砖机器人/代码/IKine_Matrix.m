%根据逆运动学方程求关节角度
function [ th1,d2,th3] = IKine_Matrix( px,py,pz )

ToDeg = 180/pi;
% 逆运动学求解
th1=-atan2(px,py);
th3=acos((100-pz)/100);
d2=py*cos(th1)-px*sin(th1)-100*sin(th3);

th1=th1*ToDeg;
th3=th3*ToDeg;
end

