% matlab function m.file that specifies PDE in time and one space dimension
function [c,b,s] = eq1(x,t,u,DuDx)
c = pi^2;
b = DuDx;
s = 0;
end