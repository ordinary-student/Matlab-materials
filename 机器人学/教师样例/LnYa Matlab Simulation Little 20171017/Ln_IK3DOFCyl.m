function [th1,d1,d2]=Ln_IK3DOFCyl(x,y,z)


th1=atan(y/x);
d1=z;
d2=x/cos(th1);


th1=th1/pi*180;

