close all;
% A(1:90)=struct('cdata',[],'colormap',[]);
clear;

global Link
Lnya_Build_Puma560;

th=[0,0,0,0,0,0];

num=1;

for th1=1:1:1
    for th2= -225:5:45
        for th3=-45:15:225
%             for th4=-100:70:170
%                 for th5=-100:50:100
%                     for th6=-226:50:226      
                        fprintf('%d %d %d   \n',[th1,th2,th3]');
                        Lnya_DHfk_Puma560(th1,th2,th3,0,0,0,1); 
                        x(num)=Link(5).p(1);
                        y(num)=Link(5).p(2);
                        z(num)=Link(5).p(3);
                        num=num+1;
                        plot3(x,y,z,'r*');hold on;
%                     end
%                 end
%             end
        end
    end
end

  
                        
 



% for d1=0:10:200
%     for th=-120:10:120
%         for d2=0:10:100
%             thx=th*pi/180;
%             A1=[ 1 0 0 0;
%                  0 1 0 0; 
%                  0 0 1 d1;
%                  0 0 0 1];
%             A2=[cos(thx) -sin(thx) 0 0;
%                 sin(thx) cos(thx) 0 0; 
%                 0 0 1 0; 
%                 0 0 0 1];
%             A3=[ 1 0 0 d2;
%                  0 1 0 0; 
%                  0 0 1 0;
%                  0 0 0 1];
%             
%             p=A1*A2*A3;
%             plot3(p(1,4),p(2,4),p(3,4)); hold on;
%         end
%     end
% end

    





