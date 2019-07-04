% Function: get numerical solution
% Date: 2018/04/06
clc;
clear all;

global Link

th1 = 150;
dz = 50;
th3 = 60;
th4 = -60;
th5 = 90;
th6 = 90;
dtime=0.01;
Link_J_MyRobot(th1,dz,th3,th4,th5,th6,0); 
pause;hold off;

x_taget = 100;
y_taget = 100;
z_taget = 100;
R_taget = [1, 0, 0;
           0, 1, 0;
           0, 0, 1];
% nx = 1; sx = 0; ax = 0;
% ny = 0; sy = 1; ay = 0;
% nz = 0; sz = 0; az = 1;
num=1;
x=[];
y=[];
z=[];
Loss = calculate_err(x_taget,y_taget,z_taget,R_taget);
while (Loss >0.000001)
    x_now=Link(7).p(1);
    y_now=Link(7).p(2);
    z_now=Link(7).p(3);
    R = Link(7).R;

    J=Jacobi_MyRobot(th1,dz,th3,th4,th5,th6);
    learning_rate = 0.1;
    D = det(J);
    if D == 0
        fprintf('D= %2.4f ',D); fprintf('\n'); 
        fprintf('Pass the singilarity !'); fprintf('\n');
        pause;
    end
    p_err = [x_taget - x_now;
             y_taget - y_now;
             z_taget - z_now];
    R_err = R' * R_taget;
    Err_th = acos((R_err(1,1) + R_err(2,2) + R_err(3,3) - 1)/2);
    r_err = (Err_th / (2 * sin(Err_th)))^2 *  ...
            [R_err(3,2)-R_err(2,3); R_err(1,3)-R_err(3,1); R_err(2,1)-R_err(1,2)];

    dth = learning_rate * inv(J) * [p_err; r_err];
    th1=th1 + dth(1)/pi*180;
    dz=dz + dth(2);
    th3=th3 + dth(3)/pi*180;
    th4=th4 + dth(4)/pi*180;
    th5=th5 + dth(5)/pi*180;
    th6=th6 + dth(6)/pi*180;
    Link_J_MyRobot(th1,dz,th3,th4,th5,th6,1);
    x(num)=Link(7).p(1);
    y(num)=Link(7).p(2);
    z(num)=Link(7).p(3);
    num=num+1;
    plot3(x,y,z,'r.');grid on;
    hold on;
    Loss = calculate_err(x_taget,y_taget,z_taget,R_taget);
end

























