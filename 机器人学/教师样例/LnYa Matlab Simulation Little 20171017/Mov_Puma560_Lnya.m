close all;
clear;

figure; 

th1=0;
th2=0;
th3=0;
th4=0;
th5=0;
th6=0;
stp=5;
dtime=0.02;
DHfk_Puma560_Lnya(th1,th2,th3,th4,th5,th6,0); 

pause;hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for th=0:stp:160
   DHfk_Puma560_Lnya(th,th2,th3,th4,th5,th6,1); 
end
for th=160:-stp:-160
   DHfk_Puma560_Lnya(th,th2,th3,th4,th5,th6,1); 
end

for th=-160:stp:0
    if th~=0
       DHfk_Puma560_Lnya(th,th2,th3,th4,th5,th6,1); 
    else
       DHfk_Puma560_Lnya(th,th2,th3,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2
for th=0:stp:45
   DHfk_Puma560_Lnya(th1,th,th3,th4,th5,th6,1); 
end
for th=45:-stp:-225
   DHfk_Puma560_Lnya(th1,th,th3,th4,th5,th6,1); 
end

for th=-225:stp:0
    if th~=0
       DHfk_Puma560_Lnya(th1,th,th3,th4,th5,th6,1); 
    else
       DHfk_Puma560_Lnya(th1,th,th3,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3
for th=0:stp:225
   DHfk_Puma560_Lnya(th1,th2,th,th4,th5,th6,1); 
end
for th=225:-stp:-45
   DHfk_Puma560_Lnya(th1,th2,th,th4,th5,th6,1); 
end

for th=-45:stp:0
    if th~=0
       DHfk_Puma560_Lnya(th1,th2,th,th4,th5,th6,1); 
    else
       DHfk_Puma560_Lnya(th1,th2,th,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint4
for th=0:stp:170
   DHfk_Puma560_Lnya(th1,th2,th3,th,th5,th6,1); 
end
for th=170:-stp:-110
   DHfk_Puma560_Lnya(th1,th2,th3,th,th5,th6,1); 
end

for th=-110:stp:0
    if th~=0
       DHfk_Puma560_Lnya(th1,th2,th3,th,th5,th6,1); 
    else
       DHfk_Puma560_Lnya(th1,th2,th3,th,th5,th6,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint5
for th=0:stp:100
   DHfk_Puma560_Lnya(th1,th2,th3,th4,th,th6,1); 
end
for th=100:-stp:-100
   DHfk_Puma560_Lnya(th1,th2,th3,th4,th,th6,1); 
end

for th=-100:stp:0
    if th~=0
       DHfk_Puma560_Lnya(th1,th2,th3,th4,th,th6,1); 
    else
       DHfk_Puma560_Lnya(th1,th2,th3,th4,th,th6,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint6
for th=0:stp:226
   DHfk_Puma560_Lnya(th1,th2,th3,th4,th5,th,1); 
end
for th=226:-stp:-226
   DHfk_Puma560_Lnya(th1,th2,th3,th4,th5,th,1); 
end

for th=-226:stp:0
    if th~=0
       DHfk_Puma560_Lnya(th1,th2,th3,th4,th5,th,1); 
    else
       DHfk_Puma560_Lnya(th1,th2,th3,th4,th5,th,0);   
    end
end

