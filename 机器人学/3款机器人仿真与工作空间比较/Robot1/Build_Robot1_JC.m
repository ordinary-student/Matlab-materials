% Build_Robot1_JC
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';
Link= struct('name','Body' , 'th',  0, 'dz', 0, 'dx', 0, 'alf',0*ToRad,'az',UZ);    
Link(1)= struct('name','World' , 'th',  0*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);       
Link(2) = struct('name','J1' , 'th',   90*ToRad, 'dz', -50, 'dx', 0, 'alf',90*ToRad,'az',UZ);       
Link(3) = struct('name','J2' , 'th',  -90*ToRad, 'dz', 0, 'dx', 0, 'alf',90*ToRad,'az',UZ);    
Link(4) = struct('name','J3' , 'th',  0*ToRad, 'dz', 100, 'dx', 0, 'alf',-90*ToRad,'az',UZ);          
Link(5) = struct('name','J4' , 'th',  0*ToRad, 'dz', 0, 'dx', -100, 'alf',0*ToRad,'az',UZ); 