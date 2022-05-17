name = "gain";
eval(sprintf("mkdir %s",name));
hold on
fittedmodel = fitPhase;

set(gca,'FontSize',30);

%Add labels:

% phase graph
% errorbar(fitFrequencyInLog,phi,phiError,phiError,inputFrequencyErrorLog,inputFrequencyErrorLog,LineStyle="none") 
% title('Phase Difference as Function of Angular Frequency', 'FontSize',35);
% xlabel('ln of angular frequency (rad/s)','FontSize',20);
% ylabel('phase difference (rad)','FontSize',20);

% gain graph
errPlot = errorbar(fitFrequencyIn,VB,VBerror,VBerror,fitFrequencyInError,fitFrequencyInError,LineStyle="none") 
xlabel('Angular Frequency (rad / s)','FontSize',20);
ylabel('Voltage gain (DB)','FontSize',20);
title('Gain in RC Circuit', 'FontSize',30);
errPlot.LineWidth = 5;
grid on;
grid minor;

% ampout grpah
% errPlot = errorbar(fitFrequencyIn,AOut,AOuterror,AOuterror,fitFrequencyInError,fitFrequencyInError,LineStyle="none") 
% errPlot2 = errorbar(fitFrequencyIn(11),AOut(11),AOuterror(11),AOuterror(11),fitFrequencyInError(11),fitFrequencyInError(11), "*r") 

% xlabel('Angular Frequency (rad / s)','FontSize',20);
% ylabel('Amplitude on The Capcitor (volt)','FontSize',20);
% title('Amplitude on The Capcitor', 'FontSize',30);
% errPlot.LineWidth = 5;
% errPlot2.LineWidth = 5;
% legend([errPlot, errPlot2], {"regular points", "wierd points"});
s=findobj('type','legend')
delete(s)



grid on;
grid minor;


saveas(gca, sprintf("%s/%s.png", name, name), "png");
saveas(gca, sprintf("%s/%s.fig", name, name), "fig");
saveas(gca, sprintf("%s/%s.svg", name, name), "svg");



errors = calcErrorMain(fittedmodel)
generateResults(fittedmodel, errors)








