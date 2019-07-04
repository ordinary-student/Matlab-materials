function [ sysT ] = nengkongbiaozhunxing( A,B,C,D )
%化为能控标准型
%   此处显示详细说明
sys=ss(A,B,C,D);
Qc=ctrb(A,B);
pc1=[0 0 1]*inv(Qc);
Pc=inv([pc1;pc1*A;pc1*A*A]);
sysT = ss2ss(sys,inv(Pc));
end

