function [x,y,z]=GetOldBlockPos( block_num  )
%生成旧砖头的位置
%输入砖头的数量
global block
Blocks;

%砖头旧位置
block_oldX=zeros(block_num,1);
block_oldY=zeros(block_num,1);
block_oldZ=zeros(block_num,1);

%给坐标赋值
for i=1:1:block_num
    block_oldX(i)=150;
    block_oldY(i)=0;
    block_oldZ(i)=block.startHeight+block.h*i;
end

x=block_oldX;
y=block_oldY;
z=block_oldZ;
end

