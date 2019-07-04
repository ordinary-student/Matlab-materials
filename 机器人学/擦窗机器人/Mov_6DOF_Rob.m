close all;
clear;

global Link

ToDeg = 180/pi;
ToRad = pi/180;

th1=0;
th2=-90;
th3=0;
d4=50;
th5=0;
th6=90;
DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6,0,1);%零状态
view(134,12);

%pause;
step=30;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for i=0:step:360
   DHfk6Dof_Workplace(th1+i,th2,th3,d4,th5,th6,1,1);
end
for i=360:-step:0
   DHfk6Dof_Workplace(th1+i,th2,th3,d4,th5,th6,1,1);
end

for i=0:step:90
   DHfk6Dof_Workplace(th1,th2+i,th3,d4,th5,th6,1,1);
end
for i=90:-step:-90
   DHfk6Dof_Workplace(th1,th2+i,th3,d4,th5,th6,1,1);
end
for i=-90:step:0
   DHfk6Dof_Workplace(th1,th2+i,th3,d4,th5,th6,1,1);
end

for i=0:-step:-180
   DHfk6Dof_Workplace(th1,th2,th3+i,d4,th5,th6,1,1);
end
for i=-180:step:0
   DHfk6Dof_Workplace(th1,th2,th3+i,d4,th5,th6,1,1);
end

for i=0:10:200
   DHfk6Dof_Workplace(th1,th2,th3,d4+i,th5,th6,1,1);
end
for i=200:-10:-40
   DHfk6Dof_Workplace(th1,th2,th3,d4+i,th5,th6,1,1);
end
for i=-40:10:0
   DHfk6Dof_Workplace(th1,th2,th3,d4+i,th5,th6,1,1);
end

for i=0:step:360
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5+i,th6,1,1);
end
for i=360:-step:0
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5+i,th6,1,1);
end

for i=0:step:90
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,1,1);
end
for i=90:-step:-90
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,1,1);
end
for i=-90:step:0
   DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,1,1);
end

%回归零状态
DHfk6Dof_Workplace(th1,th2,th3,d4,th5,th6+i,0,1);
