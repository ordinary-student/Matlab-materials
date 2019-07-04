th1=45/180*pi;
th2=90/180*pi;
L1=100;
L2=100;

S1=sin(th1);
C1=cos(th1);
S12=sin(th1+th2);
C12=cos(th1+th2);

% th2=pi-acos( (L1^2+L2^-x^2-y^2)/2/L1/L2);
% B=acos( ((L1^2+x^2+y^2-L2^2)/(2*L1*(x^2+y^2)^0.5));
% th1=atan(y/x)-B;

   

% for th1=0:0.1:pi/2
%     th2=-2*th1;
%     
%     S1=sin(th1);
%     C1=cos(th1);
%     S12=sin(th1+th2);
%     C12=cos(th1+th2);
%     x=L1*C1+L2*C12;
%     y=L1*S1+L2*S12;
%     plot(x,y,'R+'); pause(0.001);hold on;grid on;
% end

dth1=0;
dth2=0;


for x=-200:1:200
    y=0;
    th2=pi-acos( (L1^2+L2^2-x^2-y^2)/(2*L1*L2) );
    B=acos(  (L1^2+x^2+y^2-L2^2)  /  (2*L1*(x^2+y^2)^0.5) );
    th1=atan(y/x)-B;
    th1=th1/pi*180;
    th2=th2/pi*180;
    if x==0
        dth1=th1;
        dth2=th2;
    else
       plot(x,th1-dth1,'b+');
       plot(x,th2-dth2,'R+'); pause(0.001);hold on;grid on;  
       axis([-220,220,-100,100]);
       dth1=th1;
       dth2=th2;
    end

end

    
    
%     dx=-L1*S1*dth1-L2*S12*(dth1+dth2);
%     dy=L1*C1*dth1+L2*C12*(dth1+dth2);
% for dth1=-1:0.01:1
%     dth2=-(1-dth1^2)^0.5;
%     x=-L1*S1*dth1-L2*S12*(dth1+dth2);
%     y=L1*C1*dth1+L2*C12*(dth1+dth2);
%     plot(x,y,'y+'); pause(0.001);hold on; grid on;
% end
% 
%  dth1=0;
%     dth2=-(1-dth1^2)^0.5;
%     x=-L1*S1*dth1-L2*S12*(dth1+dth2);
%     y=L1*C1*dth1+L2*C12*(dth1+dth2);
%     plot(x,y,'bX'); pause(0.01);hold on; grid on;
% 
%     
%      dth1=0;
%     dth2=(1-dth1^2)^0.5;
%     x=-L1*S1*dth1-L2*S12*(dth1+dth2);
%     y=L1*C1*dth1+L2*C12*(dth1+dth2);
%     plot(x,y,'rX'); pause(0.01);hold on; grid on;