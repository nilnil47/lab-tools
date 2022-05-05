function [fit_, gof_] = oneFit(t, v, name)
%oneFit - Description
%
% Syntax: fit = oneFit(t, v)
%
% Long description



[t, v] = prepareCurveData( t, v);

vMax = max(v);
vMin = min(v);

amplitudeStartPoint = (vMax - vMin) / 2
zeroStartPoint = (vMax + vMin) / 2
omegaStart = 2*pi*str2double(name(2:end))
phaseStart = 0

ft = fittype( 'a1*cos(b1*x+c1)+d1', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Upper = [Inf, Inf, pi, Inf];
opts.Lower = [0, 0, -pi, -Inf];
opts.StartPoint = [amplitudeStartPoint, omegaStart, phaseStart, zeroStartPoint];

% ft = fittype( 'a*cos(b*x+c)+d', 'independent', 'x', 'dependent', 'y' );
% opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
% opts.Display = 'Off';
% opts.Lower = [-Inf -Inf 0 -Inf];
% opts.StartPoint = [0.007 600000 0.0703759460967929 0.817627708322262];
% opts.Upper = [Inf Inf 6.28 Inf];


[fit_, gof_] = fit( t, v, ft, opts );
    
end

