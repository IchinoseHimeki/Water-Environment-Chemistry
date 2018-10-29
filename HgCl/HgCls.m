%%
format long;
b1=10^7.15;
b2=10^14.05;
b3=10^15.05;
b4=10^15.75;
Hg0=(0.4/296.653)/(60/1000);
Cl0=1/(35.446*3);
Hg=(0.4/296.653)/(60/1000);
Cl=1/(35.446*3);
while 1
    Hg = Hg-10^-10;
    Cl = Cl-10^-10;
    HgCl = b1*Hg*Cl;
    HgCl2 = b2*Hg*Cl^2;
    HgCl3 = b3*Hg*Cl^3;
    HgCl4 = b4*Hg*Cl^4;
    CHg=Hg+Cl+HgCl+HgCl2+HgCl3+HgCl4;
    CCl=Cl+HgCl+2*HgCl2+3*HgCl3+4*HgCl4;
    if (abs(CHg-Hg0)/Hg0<=10^-3) || (abs(CCl-Cl0)/Cl0<=10^-3)
        disp(Hg)
        disp(Cl)
        disp(HgCl)
        disp(HgCl2)
        disp(HgCl3)
        disp(HgCl4)
        break;
    end
end