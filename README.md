# Inverse-Kine-Eq-Solver
Firstly, make sure to have RVC tool MATLAB installed on your pc, if not then download from peter corke site:
 
https://petercorke.com/toolboxes/robotics-toolbox/
Install this toolbox by opening it in matlab:
 
and also download the RVC tool folder from this link:
https://drive.google.com/drive/folders/1vYoySRDxTGviYp98PpAfyx3L4xWTeDeC?usp=drive_link

download and extract RVC and then navigate to this RVC folder:
 
On Matlab command line, run:
>>Startup_rvc
 
After this, open the .m file which I have sent you and run the script:
 
I have already set the desired coordinates in the X_desired variable, now to find if your arm can reach the desired position, you can use .plot function with different theta values and once you reach the desired position, use these angles in forward kinematics to find the position of the end effector.
Example:
For this pose:
 
I have used these angles:
 
Now use these angles to find position of end effector:
In the command window, run forward kinematics:
 
The last column contains x,y,z of the position of end effector.
Now, use these values in X_desired and find the required thetas in q_sol array and use robot.plot() to plot your pose.
