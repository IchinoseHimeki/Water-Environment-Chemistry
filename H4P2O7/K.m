syms G0F G0S T R H0F H0S FNumber SNumber sumG0F sumH0F sumG0F G0 H0 K0 K

T=298.15; %%stanard temperature
T1=298.15; %%Now tempurature
R=8.314*10^(-3); %%
G0F=[-2161.7]; %% Gibbs free energy of Reactant
G0S=[-553.54,-454.8,-527.9]; %% Gibbs free energy of Resultant
H0F=[-2324.5];  %%Enthalpy changes of Reactant
H0S=[-542.8,-466.8,-677.1]; %%Enthalpy changes of Resultant
FNumber=[1]; %%Reactant 
SNumber=[1,1,2]; %% Resultant
sumG0F=0;sumG0S=0;sumH0S=0;sumH0F=0;

if (length(G0F)==length(H0F)&&length(H0F)==length(FNumber))&&(length(G0S)==length(H0S)&&length(H0S)==length(SNumber))
    for i=1:length(FNumber)
        sumG0F = sumG0F+G0F(i)*FNumber(i);
        sumH0F = sumH0F+H0F(i)*FNumber(i);
    end
    for j=1:length(SNumber)
        sumG0S = sumG0S+G0S(j)*SNumber(j);
        sumH0S = sumH0S+H0S(j)*SNumber(j);
    end
    
    G0=sumG0S-sumG0F;
    H0=sumH0S-sumH0F;
    K0=exp((G0)/(-R*T));
    K=10^(log10(K0)-(H0*((1/T1)-(1/T))/2.3*R));
    
    disp(K0)
    disp(K)
    
else
    disp("Wrong Varible Numbers!")
    throw()
end


    
