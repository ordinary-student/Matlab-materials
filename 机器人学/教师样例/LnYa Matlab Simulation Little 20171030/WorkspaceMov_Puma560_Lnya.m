close all;
% A(1:90)=struct('cdata',[],'colormap',[]);
clear;

global Link
Build_Puma560_Lnya;

th=[0,0,0,0,0,0];

num=1;



for th1=-160:20:160
    for th2= -225:30:45
        for th3=-45:30:225
            for th4=-100:30:170
                for th5=-100:30:100
                    for th6=-226:100:226      
                        fprintf('%d %d %d %d %d %d  \n',[th1,th2,th3,th4,th5,th6]');
                        DHfk_Puma560_Lnya(th1,th2,th3,th4,th5,th6,1); 

                        x(num)=Link(7).p(1);
                        y(num)=Link(7).p(2);
                        z(num)=Link(7).p(3);
                        num=num+1;
                        plot3(x,y,z,'r*');hold on;
                    end
                end
            end
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

    





