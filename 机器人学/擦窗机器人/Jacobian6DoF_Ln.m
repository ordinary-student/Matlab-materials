function J=Jacobian6DoF_Ln(th1,th2,th3,d4,th5,th6)
% close all
global Link

jsize=6;
J=zeros(6,jsize);

Link(2).th=th1*pi/180;
Link(3).th=th2*pi/180;
Link(4).th=th3*pi/180;
Link(5).dz=d4;
Link(6).th=th5*pi/180;
Link(7).th=th6*pi/180;
   
for i=1:7
Matrix_DH_Ln(i);
end

Link(1).p=Link(1).p(1:3);
for i=2:7
      Link(i).A=Link(i-1).A*Link(i).A;
      Link(i).p= Link(i).A(:,4);
      Link(i).n= Link(i).A(:,1);
      Link(i).o= Link(i).A(:,2);
      Link(i).a= Link(i).A(:,3);
      Link(i).R=[Link(i).n(1:3),Link(i).o(1:3),Link(i).a(1:3)];
end

target=Link(7).p(1:3);

for n=1:3
     a=Link(n).R*Link(n).az;  
     J(:,n)=[cross(a,target-Link(n).p(1:3)); a];
end

for n=4:4
     a=Link(n).R*Link(n).az;  
     J(:,n)=[a; [0,0,0]'];
end

for n=5:jsize
     a=Link(n).R*Link(n).az;  
     J(:,n)=[cross(a,target-Link(n).p(1:3)); a];
end
    



