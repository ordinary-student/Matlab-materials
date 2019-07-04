function  DrawAllBlocks( block_x, block_y, block_z ,bool)
%画出所有的砖头
%输入：砖头的位置，旧砖还是新砖
global block
Blocks;

%新砖
if  (bool)
    block_size=size(block_x);
    block_num=block_size(1,1);
    for i=1:1:block_num
        plotcube([block.l, block.w, block.h],[block_x(i)-block.l/2 , block_y(i)-block.w/2 , block_z(i)-block.h],1,block.color);
        hold on;
    end
    
    %旧砖
else
    block_size=size(block_x);
    block_num=block_size(1,1);
    for i=1:1:block_num
        plotcube([block.l, block.w, block.h],[block_x(i)-block.l/2 , block_y(i)-block.w/2 , block_z(i)-block.h],1,block.color);
        hold on;
    end
end

end

