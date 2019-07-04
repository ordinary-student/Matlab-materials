close all;
% A(1:90)=struct('cdata',[],'colormap',[]);
clear;


for d1=0:10:200
    for th=-120:10:120
        for d2=0:10:100
            thx=th*pi/180;
            A1=[ 1 0 0 0;
                 0 1 0 0; 
                 0 0 1 d1;
                 0 0 0 1];
            A2=[cos(thx) -sin(thx) 0 0;
                sin(thx) cos(thx) 0 0; 
                0 0 1 0; 
                0 0 0 1];
            A3=[ 1 0 0 d2;
                 0 1 0 0; 
                 0 0 1 0;
                 0 0 0 1];
            
            p=A1*A2*A3;
            plot3(p(1,4),p(2,4),p(3,4)); hold on;
        end
    end
end

    





