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
% ft = fittype( 'v*cos(w*x+p)-c', 'independent', 'x', 'dependent', 'y' );
ft = fittype( 'sin1');
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 0 -Inf];
% opts.StartPoint = [3.21586015845373 str2double(name(2:end)) -0.391565891393376];
opts.StartPoint = [3.21586015845373 2*pi*str2double(name(2:end)) -0.391565891393376];



% Fit model to data.
[fitresultIn, gofIn] = fit( tIn, vIn, ft, opts );
[fitresultOut, gofOut] = fit( tOut, vOut, ft, opts );

% Plot fit with data.
fig = figure( 'Name', 'untitled fit 2' );
plot( fitresultIn, tIn, vIn);
hold on
plot( fitresultOut, tOut, vOut);

% Label axes
xlabel( 'Voltage (Volt)', 'Interpreter', 'none' );
ylabel( 'Time (s)', 'Interpreter', 'none' );
title( sprintf('Votage as Function of Time %s hz', name));
legend([sprintf("r^2 in: %f",gofIn.rsquare), sprintf("r^2 out: %f",gofOut.rsquare), ...
sprintf("In properties: %s", displayFitProperties(fitresultIn)), sprintf("Out properties: %s", displayFitProperties(fitresultOut))]);
text(0,-3, string(opts.StartPoint));
grid on

saveas(fig, sprintf("png/%s.png", name), "png");
saveas(fig, sprintf("fig/%s.fig", name), "fig");



