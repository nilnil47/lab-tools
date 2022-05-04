%Set font sizes:
hold on
errorbar(R,T,Terror,Terror,Rerror,Rerror,LineStyle="none") 
set(gca,'FontSize',30);

%Add labels:
xlabel('Resistance (Oham) ','FontSize',20);
ylabel('Self Timing (s)','FontSize',20);

% Add title:
title('Self Timing as Function of Resistence', 'FontSize',35);