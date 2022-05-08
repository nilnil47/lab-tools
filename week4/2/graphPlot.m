name = "main";
mkdir main;
hold on
errorbar(fitFrequencyInLog,AOut,AErrorPlus, AErrorMinus,inputFrequencyErrorLog,inputFrequencyErrorLog,".") 
set(gca,'FontSize',30);

%Add labels:
xlabel('ln of Input Angular Frequency','FontSize',20);
ylabel('Output / Input Amplitude ratio','FontSize' ,20);

% Add title:
title('Resonance in RLC Circuit', 'FontSize',25);

grid on
grid minor

saveas(gca, sprintf("main/%s.png", name), "png");
saveas(gca, sprintf("main/%s.fig", name), "fig");
saveas(gca, sprintf("main/%s.svg", name), "svg");

s=findobj('type','legend')
delete(s)


% errors = calcErrorMain(fittedmodel)
% generateResults(fittedmodel, errors)








