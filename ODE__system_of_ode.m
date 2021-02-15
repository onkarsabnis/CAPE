%function yp = sys_ode(t,y)

%yp = [y(1) - 0.5*y(1)*y(2) ; -y(2) + 0.25*y(1)*y(2)] ;
% end

% ode45(@sys_ode , [0 30] , [2 1])



function yp2 = sys2_ode(t,y)
yp2 = [y(2) ; -y(1)] ; 

end

%% dsolve could directly be used to solve ODEs as well