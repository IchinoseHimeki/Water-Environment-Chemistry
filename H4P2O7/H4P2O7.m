syms pKa1 pKa2 pKa3 pKa4 pH pKsp %%Define symbools which could probably be used.
pH=0:0.1:14; %%set pH from 0 to 14.
pKa1=0.70;pKa2=2.19;pKa3=6.80;pKa4=9.59;pKsp=5.00;
unlog=inline('(10.^(-x))','x'); %#ok<DINLN> Do the Unlog operation.
sub1=(unlog(pH).^4+unlog(pKa1).*(unlog(pH)).^3+unlog(pKa1).*unlog(pKa2).*(unlog(pH)).^2+unlog(pKa1)...
    .*unlog(pKa2).*unlog(pKa3).*unlog(pH)+unlog(pKa1).*unlog(pKa2).*unlog(pKa3).*unlog(pKa4));
    %% To make it more clear.
%%
pH3=pKa1+pKsp-pH;
pH2=pKa1+pKa2+pKsp-2*pH;
pH1=pKa1+pKa2+pKa3+pKsp-3*pH;
pH0=pKa1+pKa2+pKa3+pKa4+pKsp-4*pH;
%%
figure(1)
%%
plot(pH,pH3)
hold on
plot(pH,pH2)
hold on
plot(pH,pH1)
hold on
plot(pH,pH0)
%%
title('焦磷酸pC与pH之间的关系','FontSize',15,'FontName','Microsoft YaHei UI');
grid on
xlabel('pH','FontName','Microsoft YaHei UI');
ylabel('pC','FontName','Microsoft YaHei UI');
legend("H_3P_2O_7^-","H_2P_2O_7^2-","HP_2O_7^3-","P_2O_7^4-");
%%
figure(2)
%%
pa1=-log10(10.^(-pH).^4./sub1);
pa2=-log10(10.^(-pH).^3.*unlog(pKa1)./sub1);
pa3=-log10(10.^(-pH).^2.*unlog(pKa1).*unlog(pKa2)./sub1);
pa4=-log10(10.^(-pH).*unlog(pKa1).*unlog(pKa2).*unlog(pKa3)./sub1);
pa5=-log10(unlog(pKa1).*unlog(pKa2).*unlog(pKa3).*unlog(pKa4)./sub1);

%%
plot(pH,pa1)
hold on
plot(pH,pa2)
hold on
plot(pH,pa3)
hold on
plot(pH,pa4)
hold on
plot(pH,pa5)


%%
%Drawing for Figure2
set(gca,'XAxisLocation','top'); %%Set x's axis to top
set(gca,'YDir','reverse'); %% Reverse Y
title({'焦磷酸p\alpha与pH之间的关系'},'FontSize',15,'FontName','Microsoft YaHei UI');
grid on
xlabel('pH','FontName','Microsoft YaHei UI');
ylabel('p\alpha','FontName','Microsoft YaHei UI');
legend("H_4P_2O_7","H_3P_2O_7^-","H_2P_2O_7^2-","HP_2O_7^3-","P_2O_7^4-",'Location','southwest');
annotation('textbox',[0.15 0 0.75 0.1],'VerticalAlignment','middle',...
    'String',{'pK_a_1=0.70 pK_a_2=2.19 pK_a_3=6.80 pK_a_4=9.59'},...
    'HorizontalAlignment','center',...
    'FontName','Microsoft YaHei UI Light',...
    'FitBoxToText','off',...
    'EdgeColor','none');
