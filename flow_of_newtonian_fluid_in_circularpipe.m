clc;
clear all;

%phi = 32;   % diffusivity cm^2/s
R = 0.0025;    % particle radius, cm
%alpha = 20;    % rate constant (1/s)
%CAs = 1;  % concentration of A at outer radius of particle (mol/L)

bc =@(ya,yb) [ya(1); yb(2)];

xmesh = linspace(0,R,100);

solinit = bvpinit(xmesh, [0.2 0]);
sol = bvp4c(@ode, bc, solinit);
figure;
plot(sol.x, sol.y(2,:));
sol.x
sol.y

function dYdt = ode(r,Y)

        Wa = Y(1); % molar rate of delivery of A to surface of particle Wa = dCa/dr
        Ca = Y(2); % concentration of A in the particle at r

        if r == 0
            dWadr = 0; % this solves the singularity at r = 0
        else
            dWadr = -Wa/r - 2.8*1E+05/(0.492*4.88);
        end

        dCadr = Wa;

        dYdt = [dWadr; dCadr];
end