% Define the system of equations as a function that returns a vector of residuals
clear all
f = @(q) [
    1 - cos(q(1))*cos(q(2))*cos(q(3)) + cos(q(1))*sin(q(2))*sin(q(3));
    -cos(q(1))*cos(q(2))*sin(q(3)) - cos(q(1))*cos(q(3))*sin(q(2));
    12 - 11*cos(q(1))*cos(q(2)) - (11*cos(q(1))*cos(q(2))*cos(q(3)))/2 + (11*cos(q(1))*sin(q(2))*sin(q(3)))/2;
    cos(q(2))*cos(q(3))*sin(q(1)) - sin(q(1))*sin(q(2))*sin(q(3));
    1 + cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2));
    11*cos(q(2))*sin(q(1)) - (11*sin(q(1))*sin(q(2))*sin(q(3)))/2 + (11*cos(q(2))*cos(q(3))*sin(q(1)))/2;
    cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2));
    cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3));
    5 - 11*sin(q(2)) - (11*cos(q(2))*sin(q(3)))/2 - (11*cos(q(3))*sin(q(2)))/2 - 6
];

% Initial guess for q1, q2, q3 (in radians) it should be 1
x0 = [1.0; 1.0; 1.0];

% Use lsqnonlin to find the values of q1, q2, q3 that minimize the sum of squares of the residuals
options = optimoptions('lsqnonlin', 'Display', 'iter', 'FunctionTolerance', 1e-10, 'StepTolerance', 1e-10, 'MaxIterations', 1000);
[q, resnorm, residual, exitflag] = lsqnonlin(f, x0, [], [], options);

% Display the results
if exitflag > 0
    disp('lsqnonlin converged!');
    disp(['q1 = ', num2str(q(1)), ' rad']);
    disp(['q2 = ', num2str(q(2)), ' rad']);
    disp(['q3 = ', num2str(q(3)), ' rad']);
else
    disp('lsqnonlin did not converge.');
end



%now verify if angles are correct, draw your pose using rvc tool
% Define the robotic arm parameters (you should modify these according to your robot)
L1 = 6;   % Length of the first arm segment
L2 = 11;   % Length of the second arm segment
L3 = L2/2;   % Length of the third arm segment

% Create a 3-link robotic arm using the DH parameters
L(1) = Link([0, L1, 0, pi/2]);
L(2) = Link([0, 0, L2, 0]);
L(3) = Link([0, 0, L3, 0]);

% Combine the links to form the robot model
robot = SerialLink(L, 'name', '3-Revolute Robot Arm');

robot.plot([q(1) q(2) q(3)]);
