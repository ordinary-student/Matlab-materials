th1=90/180*pi;
th2=120/180*pi;
L1=80;
L2=80;

S1=sin(th1);
C1=cos(th1);
S12=sin(th1+th2);
C12=cos(th1+th2);

for dth1=-1:0.01:1
    dth2=(1-dth1^2)^0.5;
    x=-L1*S1*dth1-L2*S12*(dth1+dth2);
    y=L1*C1*dth1+L2*C12*(dth1+dth2);
    plot(x,y,'g+'); pause(0.001);hold on;grid on;
end

for dth1=-1:0.01:1
    dth2=-(1-dth1^2)^0.5;
    x=-L1*S1*dth1-L2*S12*(dth1+dth2);
    y=L1*C1*dth1+L2*C12*(dth1+dth2);
    plot(x,y,'g+'); pause(0.001);hold on; grid on;
end

 dth1=0;
    dth2=-(1-dth1^2)^0.5;
    x=-L1*S1*dth1-L2*S12*(dth1+dth2);
    y=L1*C1*dth1+L2*C12*(dth1+dth2);
    plot(x,y,'bX'); pause(0.01);hold on; grid on;

    
     dth1=0;
    dth2=(1-dth1^2)^0.5;
    x=-L1*S1*dth1-L2*S12*(dth1+dth2);
    y=L1*C1*dth1+L2*C12*(dth1+dth2);
    plot(x,y,'rX'); pause(0.01);hold on; grid on;