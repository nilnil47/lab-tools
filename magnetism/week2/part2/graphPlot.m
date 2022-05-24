name = "main";
mkdir main;
hold on
fittedmodel = fit_i_w;

x = I(:,2);
y = w;
xErrorPlus = Idelta(:,1);
xErrorMinus = Idelta(:,2);
yErrorPlus = wError;
yErrorMinus = wError;

errorbar(x,y,yErrorMinus,yErrorPlus,xErrorMinus,xErrorPlus,LineStyle="none") 
% plot(fittedmodel);
% set(gca,'FontSize',30);

%Add labels:
xlabel('Current (A)','FontSize',20);
ylabel('Magnetic Force (N)','FontSize',20);

% Add title:
% title('1 / Self Timing as Function of Resistence', 'FontSize',35);

saveas(gca, sprintf("main/%s.png", name), "png");
saveas(gca, sprintf("main/%s.fig", name), "fig");
saveas(gca, sprintf("main/%s.svg", name), "svg");

errors = calcErrorMain(fittedmodel)
generateResults(fittedmodel, errors)








