%搬砖
close all;
clear;
clc;

global Link
global block
Blocks;


%生成旧砖头的位置
[block_oldX,block_oldY,block_oldZ]=GetOldBlockPos(block.num );
% 画出旧砖头
DrawAllBlocks( block_oldX, block_oldY, block_oldZ,0 );
old=block.num;

%砖头新位置
block_newX=zeros(2,1);
block_newY=zeros(2,1);
block_newZ=zeros(2,1);
new=1;

%砖头当前高度
currentHeight=block.startHeight;
%位置半径
rr=150;
%砖头堆最高高度
endHeight=block.startHeight+block.num*block.h;

%搬运过程中临时存放的位置
x_temp=0;
y_temp=0;
z_temp=0;
ch_temp=currentHeight;
eh_temp=endHeight;


for i=1:1:block.num
    h_step=(block.num+1-2*i)*block.h/23;
    %搬砖
    for j=0:0.1:pi
        
        xx=rr*cos(j);
        yy=rr*sin(j);
        
        if (j>0.8)%已经搬开了45度角的距离
            if(j>3)
                %求逆解
                [th1,d2,th3]= IKine_Matrix(xx,yy,currentHeight);%在途中变低位
            else
                %求逆解
                [th1,d2,th3]= IKine_Matrix(xx,yy,eh_temp);%在途中变低位
                eh_temp=eh_temp-h_step;
            end
        else
            %求逆解
            [th1,d2,th3]= IKine_Matrix(xx,yy,endHeight);%从最上面开始搬
        end
        
        %代入正运动
        move=Move_Robot(th1,d2,th3,1);
        hold on;
        
        %搬运过程中,存放临时位置
        x_temp=Link(4).p(1);
        y_temp=Link(4).p(2);
        z_temp=Link(4).p(3);
        %画砖头
        plotcube([block.l, block.w, block.h],[x_temp-block.l/2 , y_temp-block.w/2 , z_temp-block.h],1,block.color);
        hold on;
        
        %把旧砖头对应位置删除
        block_oldX(old)=0;
        block_oldY(old)=0;
        block_oldZ(old)=0;
        %画旧砖头
        DrawAllBlocks( block_oldX, block_oldY, block_oldZ,0 );
        hold on;
        
        %画新砖头
        if (i>1)
            DrawAllBlocks( block_newX, block_newY, block_newZ,1 );
        end
        
        
    end
    
    %已经把旧砖头搬到新位置
    
    %保存砖头的新位置
    block_newX(new)=x_temp;
    block_newY(new)=y_temp;
    block_newZ(new)=z_temp;
    new=new+1;
    old=old-1;
    
    %空手回去
    for k=pi:-0.1:0
        
        xx=rr*cos(k);
        yy=rr*sin(k);
        
        %已经回去了45度角的距离
        if(k<2.3)
            if(k<0.1)
                %求逆解
                [th1,d2,th3]= IKine_Matrix(xx,yy,endHeight);%在途中恢复高位
            else
                %求逆解
                [th1,d2,th3]= IKine_Matrix(xx,yy,ch_temp);%在途中恢复高位
                ch_temp=ch_temp+h_step;
            end
        else
            %求逆解
            [th1,d2,th3]= IKine_Matrix(xx,yy,currentHeight);
        end
        
        %代入正运动
        move=Move_Robot(th1,d2,th3,1);
        hold on;
        
        %画旧砖头
        DrawAllBlocks( block_oldX, block_oldY, block_oldZ,0 );
        hold on;
        %画新砖头
        DrawAllBlocks( block_newX, block_newY, block_newZ,1 );
    end
    
    %抓手上升一个砖头的高度
    currentHeight=currentHeight+block.h;
    %最高高度下降一个砖头的高度
    endHeight=endHeight-block.h;
    ch_temp=currentHeight;
    eh_temp=endHeight;
end

zq_robot_dh(th1,d2,th3,0);
grid on;