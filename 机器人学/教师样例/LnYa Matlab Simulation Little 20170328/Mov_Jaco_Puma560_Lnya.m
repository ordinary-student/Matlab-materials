close all;
clear;

figure; 

% th1=0;
% th2=0;
% th3=0;
% th4=0;
% th5=0;
% th6=0;

th1=50;
th2=-10;
th3=-10;
th4=30;
th5=60;
th6=90;

DHfk_J_Puma560_Lnya(th1,th2,th3,th4,th5,th6,0); 
pause;
for i=1:100
DHfk_J_Puma560_Lnya(th1,th2,th3,th4,th5,th6,0);
J=Jacobian6DoF_Ln(th1,th2,th3,th4,th5,th6); 
x=det(J) ;fprintf('x= %2.4f ',x); 


dD=[0 0 3 0 0 0]';
dth=inv(J)*dD;
th1=th1+dth(1)/pi*180;
th2=th2+dth(2)/pi*180;
th3=th3+dth(3)/pi*180;
th4=th4+dth(4)/pi*180;
th5=th5+dth(5)/pi*180;
th6=th6+dth(6)/pi*180;

if i~=100
  DHfk_J_Puma560_Lnya(th1,th2,th3,th4,th5,th6,0);
else
  DHfk_J_Puma560_Lnya(th1,th2,th3,th4,th5,th6,0);
end
end



