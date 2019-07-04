function J=Jacobian6DoF_Ln(th1,th2,th3,th4,th5,th6)
% close all

global Link

jsize=6;
J=zeros(6,jsize);

for i=1:6
    for j=1:6
        fprintf('%2.0f  ',J(i,j)); 
        if j==6
          fprintf('\n');
        end
    end
end

 Link(2).th=th1*pi/180;
 Link(3).th=th2*pi/180;
 Link(4).th=th3*pi/180;
 Link(5).th=th4*pi/180;
 Link(6).th=th5*pi/180;
 Link(7).th=th6*pi/180;
   

for i=1:7
Matrix_DH_Ln(i);
end

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

for n=1:jsize
%    


%     fprintf('R=%2.0f \n',n);
%     for i=1:3
%     for j=1:3
%         fprintf('%2.4f  ',Link(n).R(i,j)); 
%         if j==3
%           fprintf('\n');
%         end
%     end
%     end
%     
%     fprintf('a=%2.0f \n',n);
%     for i=1:3
%         fprintf('%2.4f  ',Link(n).az(i)); 
%         if i==3
%           fprintf('\n');
%         end
%     end

     a=Link(n).R*Link(n).az;  
     J(:,n)=[cross(a,target-Link(n).p); a];
end


    



