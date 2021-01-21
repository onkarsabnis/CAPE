%%% Assignment 2  Problem 2
%%% To determine the equilibrium composition of ethane, ethylene and hydrogen at 1367 K temperature and 1 atm.

fun = @rooty ; %% Function named rooty
x0 = [0 0] ;
x = fsolve(fun , x0) ;

A = 1 - x(1) ;
B = x(1)*(1 - x(2)) ;
C = x(1)*(1 + x(2)) ;
D = x(1)*x(2) ;

disp(A) ;  %% Equilibrium concentration of Ethane
disp(B) ;  %% Equilibrium concentration of ethene
disp(C) ;  %% Equilibrium concentration of hydrogen
disp(D) ;  %% Equilibrium concentration of ethyne


function fun = rooty(x)

fun(1) = x(1)^2 - x(1)*x(1)*x(2)*x(2) + 37.6*x(1) - 37.6 ;
fun(2) = x(1)*x(2) + x(1)*x(2)*x(2) + 0.769*x(2) - 0.769 ;
end