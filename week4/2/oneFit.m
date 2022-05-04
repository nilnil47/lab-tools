function [fit, gof] = oneFit(t, v)
%oneFit - Description
%
% Syntax: fit = oneFit(t, v)
%
% Long description



[t, v] = prepareCurveData( t, v);

vMax = max(v);
vMin = min(v);

amplitudeStartPoint = (vMax - vMin) / 2;
zeroStartPoint = (vMax + vMin) / 2;
omegaStart = 2*pi*str2double(name(2:end);
phaseStart = 0;

ftIn = fittype( 'a1*cos(b1*x+c1)+d1', 'independent', 'x', 'dependent', 'y' );
optsIn = fitoptions( 'Method', 'NonlinearLeastSquares' );
optsIn.Display = 'Off';
optsIn.Upper = [Inf Inf 2*pi, Inf];
optsIn.Lower = [0 0 0, -Inf];
% opts.StartPoint = [3.21586015845373 str2double(name(2:end)) -0.391565891393376];
optsIn.StartPoint = [amplitudeStartPoint, omegaStart, phaseStart, zeroStartPoint];
[fit, gof] = fit( tIn, vIn, ftIn, optsIn );
    
end