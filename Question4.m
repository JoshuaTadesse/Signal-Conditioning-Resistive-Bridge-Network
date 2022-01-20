R0=1882.5;
Beta=3557.2;
Vs=-6.776;    %value of source voltage
e=2.718;
r=0.0667;     %ratio of R3 to R2
R4=200;       %value of R4
T= linspace(273,398,126);      %setting the range of the equation

Rntc= R0*e.^(Beta*(1./T - 1/283));     %calcuating the value of the variable NTC resistor

Eth=Vs.*(1./(1+R4./Rntc)-(1/(1+r)));   %calculating the value of thevenin voltage across the gap

Rth=(R4*Rntc)/(R4+Rntc)+625.3;         %calculating the value of thevenin resistance across the gap

Ith=Eth/Rth;                           %calculating the value of thevenin current across the gap

plot(T,Eth,'k');         %plotting the voltage thevenin against the input temperature range in black line
hold on;
plot(T,Ith,'g');         %plotting the current thevenin against the input temperature range in green line. value looks constant zero because of the very small current reading across gap compared to the voltage reading