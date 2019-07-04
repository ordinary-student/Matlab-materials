% Function: calculate  the error
% Date: 2018/04/06
function Loss = calculate_err(x_taget,y_taget,z_taget,R_taget)
global Link
x_now=Link(7).p(1);
y_now=Link(7).p(2);
z_now=Link(7).p(3);
R = Link(7).R;

P_err = (x_taget-x_now)^2 +(y_taget-y_now)^2 + (z_taget-z_now)^2;


if isequal(R, R_taget)
    w_R_err = 0;
else
R_err = R' * R_taget;
Err_th = acos((R_err(1,1) + R_err(2,2) + R_err(3,3) - 1)/2);
if Err_th == 0
    w_R_err = 0;
else
    w_R_err = (Err_th / (2 * sin(Err_th)))^2 *  ...
              ((R_err(3,2)-R_err(2,3))^2 + (R_err(1,3)-R_err(3,1))^2 + (R_err(2,1)-R_err(1,2))^2);
end
end
Loss = P_err + w_R_err;
end
