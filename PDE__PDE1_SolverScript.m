% PDE1: MATLAB script M.file that solves and plot solutions
% to the PDE stored in eq1.m

m = 0;
% Note that: m = 0 specifies no symmetry
% Define the solution mesh

x = linspace(0,1,20);
t = linspace(0,2,10);

% solve the PDE

sol = pdepe(m, @eq1,@init,@bc,x,t);
u = sol(:,:,1);

% plot the solution
figure
surf(x,t,u)
title('Surface plot of the solution')
xlabel('Distance x')
ylabel('Time t')