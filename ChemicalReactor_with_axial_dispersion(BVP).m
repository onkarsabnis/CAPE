clc;
clear all;

Da = 8;   
R = 1;
v = 3;
Pe = 15;

bc =@(ya,yb) [ya(1)-15*(ya(2)-1); yb(1)];

xmesh = linspace(0,R,100);

solinit = bvpinit(xmesh, [1 0]);
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
            dWadr = 15 - 15*8*Ca/(Ca+3);
        end

        dCadr = Wa;

        dYdt = [dWadr; dCadr];
end