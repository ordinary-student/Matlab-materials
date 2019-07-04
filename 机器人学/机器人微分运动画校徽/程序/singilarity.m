% Function: get Singularity
% Date: 2018/04/06
clc;
clear all;

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';
global Link

Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
Link(1)= struct('name','Base' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);      %BASE to 1
Link(2) = struct('name','J1' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);    %1 TO 2 
Link(3) = struct('name','J2' , 'th',  0*ToRad, 'dz', 100, 'dx', 0, 'alf',90*ToRad,'az',UZ);    %2 TO 3
Link(4) = struct('name','J3' , 'th',  90*ToRad, 'dz', 0, 'dx', 100, 'alf',90*ToRad,'az',UZ);  %3 TO 4
Link(5) = struct('name','J4' , 'th',  90*ToRad, 'dz', 0, 'dx', 100, 'alf',0*ToRad,'az',UZ);   %4 TO 5
Link(6) = struct('name','J5' , 'th',  0*ToRad, 'dz', 0, 'dx', 50, 'alf',90*ToRad,'az',UZ);      %5 TO 6
Link(7) = struct('name','J6' , 'th',  0*ToRad, 'dz', 0, 'dx', 50, 'alf',0,'az',UZ);           %6 TO E

syms th1 dz th3 th4 th5 th6

Link(2).th= th1*pi/180;
Link(3).dz=dz+100;
Link(4).th=th3*pi/180;
Link(5).th=th4*pi/180;
Link(6).th=th5*pi/180;
Link(7).th=th6*pi/180;

for i=1:7
    Matrix_DH_S(i);
end

for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end

jsize=6;
%J=cell(6,jsize);
Link(1).p=Link(1).p(1:3);
for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(1:3,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end
target=Link(7).p;
a = Link(1).R*Link(1).az;
J(:,1)=[cross(a,target-Link(1).p); a];
J(:,2)=[Link(2).R*Link(2).az;0;0;0];
for n=3:jsize
     a=Link(n).R*Link(n).az;  
     J(:,n)=[cross(a,target-Link(n).p); a];
end
%J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6); 
D=det(J); %fprintf('D= %2.4f ',D); fprintf('\n');