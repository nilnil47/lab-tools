function [fitresult, gof] = createFit(t, v, name)
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
[t, v] = cleanValues(t,v);
[xData, yData] = prepareCurveData( t, v );

% Set up fittype and options.
ft = fittype( 'v*(1-exp(-(1/b)*x))-c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 -Inf -Inf];
opts.StartPoint = [0.001 0.201942950299838 0.136068558708664];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
fig = figure( 'Name', 'untitled fit 2' );
plot( fitresult, xData, yData);
% Label axes
xlabel( 'R1508_t', 'Interpreter', 'none' );
ylabel( 'R1508_v', 'Interpreter', 'none' );
legend(sprintf("r^2: %f",gof.rsquare));
grid on

saveas(fig, sprintf("png/%s.png", name), "png");
saveas(fig, sprintf("fig/%s.fig", name), "fig");



