function [th1,th2,th3,d4,th5,th6] = Move_IK(th1,th2,th3,d4,th5,th6,Target)
global Link
num=1;
while 1
    figure(1);
    DHfk6Dof(th1,th2,th3,d4,th5,th6,0,0);
    
    J=Jacobian6DoF_Ln(th1,th2,th3,d4,th5,th6);
    x=det(J) ;
    
    err = CalcVWerr(Target, Link(7));
    E = err'*err;
    if E<1e-6
        break
    end
    
    E_tmp = E;
    lambda = 1;
    while E-E_tmp<=0
        dD = lambda*err;
        dth=inv(J)\dD;
        th1_tmp=th1+dth(1)/pi*180;
        th2_tmp=th2+dth(2)/pi*180;
        th3_tmp=th3+dth(3)/pi*180;
        d4_tmp=d4+dth(4);
        th5_tmp=th5+dth(5)/pi*180;
        th6_tmp=th6+dth(6)/pi*180;
        
        th2_tmp=restrain_value(th2_tmp,-180,0);
        th3_tmp=restrain_value(th3_tmp,-180,0);
        d4_tmp=restrain_value(d4_tmp,10,250);
        th6_tmp=restrain_value(th6_tmp,0,180);
        
        DHfk6Dof(th1_tmp,th2_tmp,th3_tmp,d4_tmp,th5_tmp,th6_tmp,0,0);
        err = CalcVWerr(Target, Link(7));
        E_tmp = err'*err;
        lambda = lambda/2.0;
    end
    
    th1=th1_tmp;
    th2=th2_tmp;
    th3=th3_tmp;
    d4=d4_tmp;
    th5=th5_tmp;
    th6=th6_tmp;
    
    xout(num)=x;
    t(num)=num;
    E_polt(num)=E_tmp;
    
    if E_tmp<1e-6
        break
    end
    num=num+1;
end
end

