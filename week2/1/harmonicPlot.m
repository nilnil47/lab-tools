% This script works on new Matlab releases (~2017 and up)!

% This script is designed to help you create basic figures. It doesn't do
% anything you can't do on your own, but it might save you some time at
% first.

% The script is divided into four segments - Data, Fit Options, Properties and
% Execution. You must always follow the instructions in the Data segment,
% while the Fit Options and Properties segments are optional. For basic usage, there is no
% need to touch the Execution segment.

% After you follow the instructions you can run the script by clicking
% "Run" or pressing F5.

% !!! Warning !!!
% As with any script, if you have any variables in the workspace which have
% the same name as the ones in the script - they'll probablly be
% overwritten.

%% Data

% To work, the script needs four data vectors: 
%XData (horizontal axis values)
%YData (vertical axis values) 
%XErr (horizontal errors) - Assumes symmetrical errors.
%YErr (vertical errors) - Assumes symmetrical errors.
%All vecotrs must be of the same size.

%You can enter the data manually for each variable using: (remove % sign to uncomment)
%XData=[1,2,3,4,5];
%YData=[1,2,3,4,5];
%XErr=[1,2,3,4,5];
%YErr=[1,2,3,4,5];

%Or you can use any other way you like to set the data.

%Note: if you don't want to show vertical errors you can set XErr=0 and YErr=0 to
%ignore horizontal and vertical errors repectively.

%The data here is an example, you can remove it from the code when you use
%it:

function [] = harmonicPlot(harmonic_part3_table, fitresult, m)

XData=harmonic_part3_table.t;
YData=harmonic_part3_table.x;
XErr=[];
YErr=[];

%% Fit Options
%If you want to plot a fit on the figure, create the fit whatever way you
%like (cftool, fit command) and name the fit object FitResult. For example in
%the cftool use Fit->Save to workspace. Make sure to remove the line
%FitResult=0 in that case. If you don't want to plot a fit, leave the line in.

FitResult=fitresult;

%If you want the script to plot the residual graph as well, set this to
%one:
ResidualFlag=0;

%If you want to plot residuals, specify the units of the Y axis:
YAxisUnits='cm';


%% Properties

Title = "x(t) " + m + " gram, 50hz measure rate";

Legend = ["x", "Ae^(-bt)cos⁡(ωt+ϕ)  fit"];

%Axis labels:
XAxisLabel = 't (s)';
YAxisLabel = 'x (cm)';

%Axis scales. Set the parameters to 'lin' or 'log'
XScale='lin';
YScale='lin';

%Setting the figure X,Y limits.
%For the default limits leave as zero:
AxisLim = 0;
%To set manually enter values in the following format: (revomve % symbol)
%AxisLim = [minX maxX minY maxY];

%Font sizes for labels and other writings:
TitleFontSize = 30;
LabelsFontSize = 20;
OtherFontSize = 16;

%Marker Size:
MarkerSize=15;

%% Execute

if size(XData,1)==1 %For techincal reasons, if XData is a row vector turn it into column
    XData=XData';
end
if size(YData,1)==1 %For techincal reasons, if YData is a row vector turn it into column
    YData=YData';
end
    
figure % Opens new figure window
if ResidualFlag && isobject(FitResult) %If we have a fit and want to plot the residuals we need two subplots
    subplot(2,1,1)
end
if any(XErr) && any(YErr) % If both errors were specified, plots with both errors:
    p=errorbar(XData,YData,YErr,YErr,XErr,XErr); %The errors are written twice because we specify the negative and positive boundaries.
elseif any(YErr) % Only vertical errors
    p=errorbar(XData,YData,YErr); 
else % No errors
    p=plot(XData,YData);
end
if any(AxisLim) % Setting the axis limits (if specified)
    axis(AxisLim)
end

%Removing connecting lines, setting the marker type and size:
set(p,'Marker','.','LineStyle','none','MarkerSize',MarkerSize)

%Set font sizes:
set(gca,'FontSize',OtherFontSize);

%Set axis scales:
set(gca,'XScale',XScale,'YScale',YScale)

%Add labels:
xlabel(XAxisLabel,'FontSize',LabelsFontSize);
ylabel(YAxisLabel,'FontSize',LabelsFontSize);

% Add title:
title(Title, 'FontSize',TitleFontSize);

temp=gca;
if isobject(FitResult) %If we have to plot the fit
    % Create evenly spaced vector in the X interval spanned by the figure
    if XScale=='log' %For a logarithmic scale we use logarithmic spacing
        temp1=logspace(log10(temp.XLim(1)),log10(temp.XLim(2)),200);
    else %For a linear scale we use linear spacing
        temp1=linspace(temp.XLim(1),temp.XLim(2),200);
    end
    % Make sure new graphics are added and not replace older graphics
    hold on
    %Plot fit line
    p1=plot(temp1,FitResult(temp1),'LineWidth',1);
    %Move the fit line to the background so the data is on top of the fit
    uistack(p1,'bottom');
end

% Add legends, this must be done after all the fit lines
% has plotted, the order of the legends must be flipped
% because the script uses uistack on the fitline
legend(flip(Legend), 'FontSize',OtherFontSize);

%Encircle by a box and show grid:
box on
grid on

if ResidualFlag && isobject(FitResult) %If we have a fit and want to plot the residuals we need two subplots
    subplot(2,1,2)
    hold on
    %Calculate the residuals. The function FitResult(XData) calculates the
    %value of the fit at the locations of our data.
    ResData=YData-FitResult(XData);
    
    %Plots the residuals. 
    plot(XData,ResData,'LineStyle','none','Marker','.','Color','k','MarkerSize',MarkerSize)
    
    %Just for fun, plots the black lines between the points, just like
    %cftool. It's not important to understand this part of the code.
    temp1=padarray(ResData',1);
    temp1=temp1(1:numel(temp1));
    plot([temp.XLim(1),repelem(XData,3)',temp.XLim(2)],[0,temp1,0],'LineWidth',1,'Color','k')
    
    %Set font sizes:
    set(gca,'FontSize',OtherFontSize);
    %Add labels:
    xlabel(XAxisLabel,'FontSize',LabelsFontSize);
    ylabel(['Residuals (',YAxisUnits,')'],'FontSize',LabelsFontSize);
    
    %Set the X axis limits to match the original graph, and pick reasonable
    %limits for the residuals axis.
    axis([temp.XLim,min(ResData)-0.1*(max(ResData)-min(ResData)),max(ResData)+0.1*(max(ResData)-min(ResData))])
    
    %Encircle by a box and show grid:
    box on
    grid on
end

saveas(temp, Title + ".svg", "svg")
end 


