% initial conditions: matlab function m.file that specifies the initial
% condtitions for a PDE in time and one dimension

function value = init(x)
value = sin(pi*x);
end