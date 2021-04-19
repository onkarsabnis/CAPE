function parabolic
global rho cp k
global q
L=0.1     %m
k=200     %W/m-K
rho=10000 %kg/m^3
cp=500    %J/kg-K
q=1e6   %W/m^2
tend=10 %seconds

m = 0;
x = linspace(0,L,200);
t = linspace(0,tend,50);

sol = pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);
% Extract the first solution component as u.
Temperature = sol(:,:,1);

% A solution profile can also be illuminating.
figure, plot(x,Temperature(end,:))
title(strcat('Solution at t = ', num2str(tend)))
xlabel('Distance x')
ylabel('Temperature (C)')

%Plot surface temperature vs. time
figure, plot(t,Temperature(:,1))
title('Surface Temperature')
xlabel('Time (s)')
ylabel('Temperature (C)')
% --------------------------------------------------------------
function [c,f,s] = pdex1pde(x,t,u,DuDx)
global rho cp k
c = rho*cp;
f = k*DuDx;
s = 0;
% --------------------------------------------------------------
function u0 = pdex1ic(x)
u0 = 0;
% --------------------------------------------------------------
function [pl,ql,pr,qr] = pdex1bc(xl,ul,xr,ur,t)
global q
pl = q; %these two set k*dT/dx-q=0 on right side
ql = 1;
pr = ur;
qr = 0; %sets right side temperature to 0
