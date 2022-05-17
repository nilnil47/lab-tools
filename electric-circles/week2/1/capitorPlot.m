% plot(fitDown, tDown, vDown, "r");
% hold on
% plot(fitUp, tUp2, vUp2, "b")

% mkdir main
%Set font sizes:
set(gca,'FontSize',30);
fig =gca;

%Add labels:
xlabel('Time (s) ','FontSize',20);
ylabel('voltage (Volt)','FontSize',20);

% Add title:
title('Capcitor Loading and Dumping', 'FontSize',35);

% legend(["loading","dumping", "loading fit"]);

saveas(fig, "main/capitor_loading_and_dumping.png", "png");
saveas(fig, "main/capitor_loading_and_dumping.fig", "fig");
saveas(fig, "main/capitor_loading_and_dumping.svg", "svg");
