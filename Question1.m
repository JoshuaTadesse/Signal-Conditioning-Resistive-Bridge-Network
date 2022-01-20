T = [10 20 30 40 50 60 70 80 90 100];
R = [1882.5 1225.9 821.2 564.4 397.0 285.2 208.9 155.7 118.0  90.7];
e=2.718;
Xsum=0;   %initializing the sum of X values
Ysum=0;   %initializing the sum of Y values
Abar=0;   %initializing the average term

for n = 1:length(T)
    X = 1/(T(n)+273);   %setting the values of X according to the general formula
    Y = log ( R(n));    %setting the values of Y according to the general formula
    Xsum = Xsum + X ;   %summing the X values
    Ysum = Ysum + Y;    %summing the Y values
end

Xavg=Xsum/length(T);    %finding X average from the summed terms
Yavg=Ysum/length(T);    %finding Y average from the summed terms

for n = 2:length(T)
    Xbar = 1/(T(n)+273) - 1/(T(n-1)+273);     %sequential differentiation of the X average terms
    Ybar = log(R(n)) - log(R(n-1));           %sequential differentiation of the Y average terms
    Abar = Abar + Ybar/Xbar;                  %sequential differentiation of the A average terms
end

 Aavg=Abar/(length(T)-1);      %finding the slope of the equation
 
 b=Ybar-Xbar*Aavg;             %finding the y intercept of the equation
 
 Beta= Aavg;                   % finding beta of the general formula
 R0=R(1);                      %setting the R0 for the genreal formula
 
 x= linspace(0,100,200);       % setting range for the abcissa of the equation
 y= R0*e.^(Beta*((1./(x+273)-1./(T(1)+273))));      %setting the ordinate of the equation
 
 R25= R0*e.^(Beta*((1./(25+273)-1./(T(1)+273))))      %calculating the resistance at 25 degrees celsius
  
 
 dBeta = abs (log(R25/R0)/(1-298/283)^2) + abs ((1/R25)*(0.5/(1/298-1/283)))         %calculating the error of beta at 25 degrees celsius
 
 plot (T, R, 'g o');     %plotting the actual values in green dots
 hold on;
 plot(x,y,'k');          %plotting the curve fitting in black line

 
 
 