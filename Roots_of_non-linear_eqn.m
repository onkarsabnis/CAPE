%%% Assignment_2 Problem_1
%%% Given 5 chemicals and their flowrates
%%% Let prop = propane ; isob = isobutane ; nbut = nbutane ; ipent =
%%% isopentane ; npent = npentane

frates = [100 297 499.79 400 500] ; %% flowrate in lbmol/h

%%% The critical constants and accentric factors were obtained from the link

crit_temps = [369.8 408.2 425.2 460.4 469.7] ;  %%temp in Kelvin
crit_pres = [42.5 36.5 38 33.9 33.7] ;          %%pressure in bar
acc_fact = [0.153 0.183 0.199 0.227 0.251] ;    %%accentric factor

pres_given = 10 ;
temp_given = 365 ; 
mol_frac = [] ;
sum_frates = sum(frates) ; 
%%% Calculate the mole fractions of the feed

for i = frates
    mol_frac(end + 1) = i/sum_frates ;
end

%%%The relation between Ki and the other parameters is given in the problem
m = 1 ; K_value = zeros(1,5) ;
for i = crit_pres 
    j = acc_fact(m) ; k = crit_temps(m) ;
    K_vals = (i/pres_given)*exp((1-(k/temp_given))*(1+j)*5.37) ; 
    K_value(m) = K_vals;
    m = m + 1 ;        
end

syms v 

w = 1 ; eq = zeros(1,5) ; bq = zeros(1,5) ;
for i = K_value
    j = mol_frac(w) ;
    eq(w) = ((i - 1)*j) ;
    bq(w) = i - 1 ;
    w = w + 1;
end

%%% The non linear equation is:
eqn  = @(v) 0.1624/(1+2.9177*v) + 0.1192/(1+0.7209*v) + 0.0873/(1+0.3140*v)  - 0.0878/(1-0.3943*v) - 0.1417/(1-0.5094*v) ;

%%% Here u is vapor fraction of stream (V/F)
u = fzero(eqn , 0) ;

x_vals = zeros(1,5) ; %%% mol_frac in liquid stream
t = 1 ;
for i  = mol_frac 
    j = K_value(t) ;
    x_vals(t) = i/(1 + (j-1)*u) ;
    t = t + 1 ;
end

y_vals = zeros(1,5) ; %%% mol_frac in vapor stream
r = 1 ;
for i = x_vals
    j = K_value(r) ; 
    y_vals(r) = j*i ;
    r = r + 1 ;
end

fprintf("Mol fractions in Liquid Stream are:") ;
for i = x_vals disp(i) ;
end

fprintf("Mol fractions in Vapo Stream are:") ;
for j = y_vals disp(j) ;
end


