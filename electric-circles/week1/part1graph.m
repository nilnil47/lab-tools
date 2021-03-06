function createfigure(X1, Y1, YNeg1, XNeg1, X2, Y2, X3, Y3, X4, Y4)
%CREATEFIGURE(X1, Y1, YNeg1, XNeg1, X2, Y2, X3, Y3, X4, Y4)
%  X1:  errorbar x vector data
%  Y1:  errorbar y vector data
%  YNEG1:  errorbar ynegativedelta vector data
%  XNEG1:  errorbar xnegativedelta vector data
%  X2:  vector of x data
%  Y2:  vector of y data
%  X3:  vector of x data
%  Y3:  vector of y data
%  X4:  vector of x data
%  Y4:  vector of y data

%  Auto-generated by MATLAB on 03-Apr-2022 18:03:05

% Create figure
figure('Name','linear fitting (a*x+b)');

% Create axes
axes1 = axes;
hold(axes1,'on');

% Create errorbar
errorbar(X1,Y1,YNeg1,YNeg1,XNeg1,XNeg1,'LineStyle','none');

% Create plot
plot(X2,Y2,'DisplayName','amper vs. volt','Marker','.','LineStyle','none',...
    'Color',[0 0 1]);

% Create plot
plot(X3,Y3,'DisplayName','Excluded amper vs. volt','Marker','+',...
    'LineStyle','none',...
    'Color',[0 1 0]);

% Create plot
plot(X4,Y4,'DisplayName','linear fitting (a*x+b)','Color',[1 0 0]);

% Create ylabel
ylabel('current [Amper]','Interpreter','none');

% Create xlabel
xlabel('voltage [Volt]','Interpreter','none');

% Create title
title({''});

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0 2]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-0.01 0.1]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontSize',20,'XMinorGrid','on','YMinorGrid','on','ZMinorGrid',...
    'on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.169127909342448 0.66916354556804 0.18046875 0.198501872659176],...
    'Interpreter','none',...
    'FontSize',12,...
    'FontName','Aharoni');

