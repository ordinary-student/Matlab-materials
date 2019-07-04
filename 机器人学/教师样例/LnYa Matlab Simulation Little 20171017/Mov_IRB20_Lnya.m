close all;
clear;

figure; 

th1=0;
th2=0;
th3=0;
th4=0;
th5=0;
th6=0;
stp=10;
dtime=0.02;
DHfk_IRB120_Lnya(th1,th2,th3,th4,th5,th6,0); 
view(125,52);
pause;hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint1
for th=0:stp:165
   DHfk_IRB120_Lnya(th,th2,th3,th4,th5,th6,1); 
end
for th=165:-stp:-165
   DHfk_IRB120_Lnya(th,th2,th3,th4,th5,th6,1); 
end

for th=-165:stp:0
    if th~=0
       DHfk_IRB120_Lnya(th,th2,th3,th4,th5,th6,1); 
    else
       DHfk_IRB120_Lnya(th,th2,th3,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint2
for th=0:stp:110
   DHfk_IRB120_Lnya(th1,th,th3,th4,th5,th6,1); 
end
for th=110:-stp:-110
   DHfk_IRB120_Lnya(th1,th,th3,th4,th5,th6,1); 
end

for th=-110:stp:0
    if th~=0
       DHfk_IRB120_Lnya(th1,th,th3,th4,th5,th6,1); 
    else
       DHfk_IRB120_Lnya(th1,th,th3,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint3
for th=0:stp:70
   DHfk_IRB120_Lnya(th1,th2,th,th4,th5,th6,1); 
end
for th=70:-stp:-90
   DHfk_IRB120_Lnya(th1,th2,th,th4,th5,th6,1); 
end

for th=-90:stp:0
    if th~=0
       DHfk_IRB120_Lnya(th1,th2,th,th4,th5,th6,1); 
    else
       DHfk_IRB120_Lnya(th1,th2,th,th4,th5,th6,0);   
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint4
for th=0:stp:160
   DHfk_IRB120_Lnya(th1,th2,th3,th,th5,th6,1); 
end
for th=160:-stp:-160
   DHfk_IRB120_Lnya(th1,th2,th3,th,th5,th6,1); 
end

for th=-160:stp:0
    if th~=0
       DHfk_IRB120_Lnya(th1,th2,th3,th,th5,th6,1); 
    else
       DHfk_IRB120_Lnya(th1,th2,th3,th,th5,th6,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint5
for th=0:stp:120
   DHfk_IRB120_Lnya(th1,th2,th3,th4,th,th6,1); 
end
for th=120:-stp:-120
   DHfk_IRB120_Lnya(th1,th2,th3,th4,th,th6,1); 
end

for th=-120:stp:0
    if th~=0
       DHfk_IRB120_Lnya(th1,th2,th3,th4,th,th6,1); 
    else
       DHfk_IRB120_Lnya(th1,th2,th3,th4,th,th6,0);   
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Joint6
for th=0:stp:400
   DHfk_IRB120_Lnya(th1,th2,th3,th4,th5,th,1); 
end
for th=400:-stp:-400
   DHfk_IRB120_Lnya(th1,th2,th3,th4,th5,th,1); 
end

for th=-400:stp:400
    if th~=0
       DHfk_IRB120_Lnya(th1,th2,th3,th4,th5,th,1); 
    else
       DHfk_IRB120_Lnya(th1,th2,th3,th4,th5,th,0);   
    end
end

