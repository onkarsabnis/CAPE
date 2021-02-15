%%For ODESolve
clear all ; close all 
timestart = 0 ;
timeend = 100 ;
timespan = [timestart, timeend] ;
initial = [12 7] ;

[t , h] = ode45(@ODESolve , timespan , initial) ;