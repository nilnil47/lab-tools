name = "dumping";
mkdir main;
hold on

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








