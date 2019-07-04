% %Build Robot by D_H methods


ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);     % az 
Link(1)= struct('name','Base' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);        %Base ìû1
Link(2) = struct('name','J1' , 'th',   0*ToRad, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);       %1 TO 2 dx distance between x axises ÅCdz distance between z axises
Link(3) = struct('name','J2' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',-90*ToRad,'az',UZ);    %2 TO 3
Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',0,'az',UZ);          %3 TO E



% 
%       Link1             Link2
% % -------------[     ]------(O)
% %                            |
% %                            |
% %                            []
% %                            |
% %                            |
                           