% Define the desired transformation matrix (end-effector pose)
% Modify these values according to your desired end-effector pose
clear all 
clc
T_desired = [1 0 0 12.0;
             0 1 0 0;
             0 0 1 5.0;
             0 0 0 1];

% Define DH parameters
syms q1 q2 q3 % Joint angles q1, q2, and q3 (in radians)
d = [6; 0; 0];     % Link offsets
a = [0; 11; 5.5];  % Link lengths
alpha = [pi/2; 0; 0]; % Link twists (in radians)

% Transformation matrices for each link
T_01 = computeTransformationMatrix(q1, d(1), a(1), alpha(1));
T_12 = computeTransformationMatrix(q2, d(2), a(2), alpha(2));
T_23 = computeTransformationMatrix(q3, d(3), a(3), alpha(3));

% Overall transformation from base to end-effector
T_03 = T_01 * T_12 * T_23;

% Display the results
disp('Transformation matrix from base to end-effector:');
disp(T_03);

matnew = T_desired == T_03
eq1 = matnew(1,1);
eq2 = matnew(1,2);
eq3 = matnew(1,4);

%other equations are not providing any info
eq4 = matnew(2,1);
eq5 = matnew(2,2);
eq6 = matnew(2,4);
eq7 = matnew(3,1);
eq8 = matnew(3,2);
eq9 = matnew(3,4);

%run eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9 to see your equations and
%rearrange them for new file to estimate solution

% Function to compute transformation matrix
function T = computeTransformationMatrix(theta, d, a, alpha)
    T = [cos(theta)              -sin(theta)*cosd(alpha*180/pi)     sin(theta)*sin(alpha)      a*cos(theta);
         sin(theta)              cos(theta)*cosd(alpha*180/pi)     -cos(theta)*sin(alpha)     a*sin(theta);
         0                       sin(alpha)               cosd(alpha*180/pi)                 d;
         0                       0                        0                          1];
end

