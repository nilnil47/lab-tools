function [fitresultIn, fitresultOut, gofIn, gofOut] = createFit(data, name)
%CREATEFIT(R1508_T,R1508_V)
%  Create a fit.
%
%  Data for 'untitled fit 2' fit:
%      X Input : R1508_t
%      Y Output: R1508_v
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 21-Apr-2022 16:16:54


%% Fit: 'untitled fit 2'.
% [t, v] = cleanValues(t,v);
[tIn, vIn] = prepareCurveData( data.tIn, data.vIn);
[ tOut, vOut] =  prepareCurveData(data.tOut, data.vOut);

% Set up fittype and options.
ftIn = fittype( 'a1*cos(b1*x+c1)+d1', 'independent', 'x', 'dependent', 'y' );
optsIn = fitoptions( 'Method', 'NonlinearLeastSquares' );
optsIn.Display = 'Off';
optsIn.Upper = [Inf Inf 2*pi];
optsIn.Lower = [0 0 0];
% opts.StartPoint = [3.21586015845373 str2double(name(2:end)) -0.391565891393376];
optsIn.StartPoint = [0.6 2*pi*str2double(name(2:end)) 0];

ftOut = fittype( 'sin1');
optsOut = fitoptions( 'Method', 'NonlinearLeastSquares' );
optsOut.Display = 'Off';
optsOut.Upper = [Inf Inf 2*pi];
optsOut.Lower = [0 0 0];
% opts.StartPoint = [3.21586015845373 str2double(name(2:end)) -0.391565891393376];
optsOut.StartPoint = [max(vOut) 2*pi*str2double(name(2:end)) 0];



% Fit model to data.
[fitresultIn, gofIn] = fit( tIn, vIn, ftIn, optsIn );
[fitresultOut, gofOut] = fit( tOut, vOut, ftOut, optsOut );

% Plot fit with data.
fig = figure( 'Name', 'untitled fit 2' );
plotIn = plot( fitresultIn, tIn, vIn);
hold on
plotOut = plot( fitresultOut, tOut, vOut);
set(plotIn,'color','blue');

% Label axes
xlabel( 'Voltage (Volt)', 'Interpreter', 'none' );
ylabel( 'Time (s)', 'Interpreter', 'none' );
title( sprintf('Votage as Function of Time %s hz', name));
legend([sprintf("r^2 in: %f",gofIn.rsquare), sprintf("r^2 out: %f",gofOut.rsquare), ...
sprintf("In properties: %s", displayFitProperties(fitresultIn)), sprintf("Out properties: %s", displayFitProperties(fitresultOut))]);
text(0,0, string(optsOut.StartPoint));
grid on

saveas(fig, sprintf("png/%s.png", name), "png");
saveas(fig, sprintf("fig/%s.fig", name), "fig");



