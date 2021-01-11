%%MATLAB file to solve the system of linear equations in part (b) of
%%Problem 1 of Assignment-1 (CAPE)

syms  x1  x2  x3  x4  x5  x6  %% Declaring variables

%%Writing the equations
%%Given data is L = 40.8 , G = 66.7 , a = 0.72, b = 0, 
%%y7=x7/a = 0.2/0.72 = 0.2778 , x0 = 0

eqn1 = 88.824*x1 - 48.024*x2 == 0 ;            
eqn2 = 88.824*x2 - 48.024*x3 == 40.8*x1 ;
eqn3 = 88.824*x3 - 48.024*x4 == 40.8*x2;
eqn4 = 88.824*x4 - 48.024*x5 == 40.8*x3 ;
eqn5 = 88.824*x5 - 48.024*x6 == 40.8*x4 ;
eqn6 = 88.824*x6 - 13.34 == 40.8*x5;

sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [x1, x2, x3, x4, x5 , x6]);

x1Sol = sol.x1;
x2Sol = sol.x2;
x3Sol = sol.x3;
x4Sol = sol.x4;
x5Sol = sol.x5;
x6Sol = sol.x6;
