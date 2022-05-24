name = "inductor_loading_and_dumping";
eval(sprintf("mkdir %s",name));

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
title('Inductor Loading and Dumping', 'FontSize',35);

% legend(["loading","dumping", "loading fit"]);

saveas(gca, sprintf("%s/%s.png", name, name), "png");
saveas(gca, sprintf("%s/%s.fig", name, name), "fig");
saveas(gca, sprintf("%s/%s.svg", name, name), "svg");
