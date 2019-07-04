function [th1,th2,th3]=Ln_IK3DOF(L1,L2,L3,x,y,z)

if(x==0)
    if(y>0)
        th1=pi/2;
    else
        if(y<0) 
            th1=-pi/2;
        else
            th1=2*pi; %x=0,y=0, th1=2pi;
        end
    end
else
    if(x>0)
     th1=atan(y/x);
    else
     th1=pi+atan(y/x);  
    end
end


if( x==0) 
    a=y;
else
    a=x/cos(th1);
end
b=z-L1;
c=acos ( (a^2+b^2-L2^2-L3^2)/(2*L2*L3) );
d=atan (L3*sin(c)/ (L2+L3*cos(c)) );



% First solution
%th2=asin(b/(a^2+b^2)^0.5)-d;
% th2=th2;
%th3=c;

%Second solution

 th2=asin(b/(a^2+b^2)^0.5)+d;
% 
 th3=-c;

th1=th1/pi*180;
th2=th2/pi*180*-1;
th3=th3/pi*180*-1;

%  Lnya_DHfk3Dof(th1,th2,th3,0);
% %  Lnya_DHfk3Dof(th1,th2,-th3,0);