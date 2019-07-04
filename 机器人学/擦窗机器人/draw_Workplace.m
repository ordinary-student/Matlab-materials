close all;
clear;

ToDeg = 180/pi;
ToRad = pi/180;

num=1;
th_interval = 30;
d_interval = 10;

for th1=-180:10:180
    for th2=-90:th_interval:90
        for th3=-180:th_interval:0
            for d4=-40:d_interval:200
                for th5=-180:th_interval:180
                    for th6=-90:th_interval:90
                        theta1=th1*ToRad;
                        theta2=th2*ToRad;
                        theta3=th3*ToRad;
                        theta5=th5*ToRad;
                        theta6=th6*ToRad;

                        A1 =[[ cos(theta1),  0, -sin(theta1),   0]
                                [ sin(theta1),  0,  cos(theta1),   0]
                                [           0, -1,            0, 100]
                                [           0,  0,            0,   1]];
                        A2 =[[ cos(theta2 - pi/2), -sin(theta2 - pi/2), 0, 100*cos(theta2 - pi/2)]
                                [ sin(theta2 - pi/2),  cos(theta2 - pi/2), 0, 100*sin(theta2 - pi/2)]
                                [                  0,                   0, 1,                      0]
                                [                  0,                   0, 0,                      1]];
                        A3 =[[ cos(theta3),  0, -sin(theta3), -50*sin(theta3)]
                                [ sin(theta3),  0,  cos(theta3),  50*cos(theta3)]
                                [           0, -1,            0,               0]
                                [           0,  0,            0,               1]];
                        A4 =[[ 1, 0, 0,       0]
                                [ 0, 1, 0,       0]
                                [ 0, 0, 1, d4 + 50]
                                [ 0, 0, 0,       1]];
                        A5 =[[ cos(theta5), 0,  sin(theta5),  0]
                                [ sin(theta5), 0, -cos(theta5),  0]
                                [           0, 1,            0, 50]
                                [           0, 0,            0,  1]];
                        A6 =[[ cos(pi/2 + theta6), -sin(pi/2 + theta6), 0, 50*cos(pi/2 + theta6)]
                                [ sin(pi/2 + theta6),  cos(pi/2 + theta6), 0, 50*sin(pi/2 + theta6)]
                                [                  0,                   0, 1,                     0]
                                [                  0,                   0, 0,                     1]];
                        A = A1 * A2 * A3 * A4 * A5 * A6;
            
                        point1(num) = A(1,4);
                        point2(num) = A(2,4);
                        point3(num) = A(3,4);
                        num = num + 1;  
                    end
                end
            end
        end
    end
end
plot3(point1,point2,point3,'r*');
axis([-600,600,-600,600,-400,700]);
grid on;