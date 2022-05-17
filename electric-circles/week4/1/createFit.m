function [fits] = createFit(data, name)
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

fits = struct();
[tIn, vIn] = prepareCurveData( data.tIn, data.vIn);
[ tOut, vOut] =  prepareCurveData(data.tOut, data.vOut);



% Fit model to data.
% [overFit, overGof] = criticaldumpFit(tOut, vOut, name);
% [overFit, overGof] = overdumpFit(tOut, vOut, name);
[overFit, overGof] = underdumpFit(tOut, vOut, name);
[criticalFit, criticalGof] = criticaldumpFit(tOut, vOut, name);


% Plot fit with data.
fig = figure( 'Name', name );
fig.Position = [100,100,300,300];
% plot(vOut);
% plotIn = plot( fitresultIn, tIn, vIn);
hold on
plotOver = plot( overFit, tOut, vOut);
% plotCritical = plot( criticalFit, tOut, vOut);

% set(plotOver,'color','green');
% Label axes
ylabel( 'Voltage (Volt)', 'Interpreter', 'none' );
xlabel( 'Time (s)', 'Interpreter', 'none' );
title( sprintf('Votage as Function of Time %s ohm ressitor', name(2:end)));
% legend([plotOver(2), plotCritical(2)],{sprintf("r^2 over: %f",overGof.rsquare), sprintf("r^2 critical: %f",criticalGof.rsquare)})
% legend([],{})
s=findobj('type','legend')
delete(s)


legend([plotOver], {"over dump fit", "critical dump fit"})
% legend([sprintf("r^2 in: %f",gofIn.rsquare), sprintf("r^2 out: %f",gofOut.rsquare), ...
% sprintf("In properties: %s", displayFitProperties(fitresultIn)), sprintf("Out properties: %s", displayFitProperties(fitresultOut))]);
grid on

fits.critical = criticalFit;
fits.over = overFit;

saveas(fig, sprintf("critical2/png/%s.png", name), "png");
saveas(fig, sprintf("critical2/fig/%s.fig", name), "fig");

end

