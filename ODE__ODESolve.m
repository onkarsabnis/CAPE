function hdot = ODESolve(t,h) 
%%To solve
%%dh1/dt = 1 - 0.5*sqrt(h1-h2)
%%dh2/dt = 0.25*sqrt(h1-h2) - 0.25*sqrt(h2)

hdot = zeros(2,1) ;
hdot(1) = 1 - 0.5*sqrt(h(1)-h(2)) ;
hdot(2) = 0.25*sqrt(h(1)-h(2)) - 0.25*sqrt(h(2)) ; 

end