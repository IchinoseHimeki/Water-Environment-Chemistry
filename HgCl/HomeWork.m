format long;
K=(3.6*10^(-4));
p=0;
c=31.7/(1000*128);
x=10^(-10);
while 1
    Fx=c-p*K;
    if(abs(Fx-0)<=10^(-4))
        disp(p);
        disp(c);
        break;
    else
        c=c-x;
        p=p+x;
    end
end
