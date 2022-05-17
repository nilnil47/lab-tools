name = "main";
mkdir main;
hold on
fittedmodel = fit_R_T_ax_b
errorbar(R,T,Terror,Terror,Rerror,Rerror,LineStyle="none") 
% plot(fittedmodel);
set(gca,'FontSize',30);

%Add labels:
xlabel('Resistance (Oham) ','FontSize',20);
ylabel('1 / (Self Timing) (s)','FontSize',20);

% Add title:
title('1 / Self Timing as Function of Resistence', 'FontSize',35);

saveas(gca, sprintf("main/%s.png", name), "png");
saveas(gca, sprintf("main/%s.fig", name), "fig");
saveas(gca, sprintf("main/%s.svg", name), "svg");

errors = calcErrorMain(fittedmodel)
generateResults(fittedmodel, errors)








