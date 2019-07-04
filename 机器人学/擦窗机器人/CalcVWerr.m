%函数：计算误差
function err = CalcVWerr(Target, Current)
%Target目标矩阵
%Current当前矩阵
Target.p= Target.A(1:3,4);
Target.n= Target.A(:,1);
Target.o= Target.A(:,2);
Target.a= Target.A(:,3);
Target.R=[Target.n(1:3),Target.o(1:3),Target.a(1:3)];

Perr = Target.p - Current.p(1:3);%P误差
Rerr = Current.R' * Target.R;%R误差
theta = acos((Rerr(1,1)+Rerr(2,2)+Rerr(3,3)-1)/2.0);
if theta==0
    Werr=[0,0,0]';
else
    Werr = theta/(2.0*sin(theta)) * [Rerr(3,2)-Rerr(2,3);Rerr(1,3)-Rerr(3,1);Rerr(2,1)-Rerr(1,2)];
    Werr = Current.R * Werr;
end
err = [Perr;Werr];
end

