name = "2_graphs";
eval(sprintf("mkdir %s",name));
hold on
fittedmodel = fit_r_t_ax;

set(gca,'FontSize',30);

%Add labels:

%Set font sizes:
hold on
errorbar(R,T,Terror,Terror,Rerror,Rerror,LineStyle="none") 
plot(fittedmodel, R, T);
set(gca,'FontSize',30);

%Add labels:
xlabel('Resistance (Oham) ','FontSize',20);
ylabel('Self Timing (s)','FontSize',20);

% Add title:
legend({'included points','excluded points'})

grid on;
grid minor;


saveas(gca, sprintf("%s/%s.png", name, name), "png");
saveas(gca, sprintf("%s/%s.fig", name, name), "fig");
saveas(gca, sprintf("%s/%s.svg", name, name), "svg");



errors = calcErrorMain(fittedmodel)
generateResults(fittedmodel, errors, name)










% %Set font sizes:
% hold on
% errorbar(R,T,Terror,Terror,Rerror,Rerror,LineStyle="none") 
% set(gca,'FontSize',30);

% %Add labels:
% xlabel('Resistance (Oham) ','FontSize',20);
% ylabel('Self Timing (s)','FontSize',20);

% % Add title:
% title('Self Timing as Function of Resistence', 'FontSize',35);