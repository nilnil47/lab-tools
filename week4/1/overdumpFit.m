function [fit_, gof_] = overdumpFit(t, v, name)
%oneFit - Description
%
% Syntax: fit = oneFit(t, v)
%
% Long description



[t, v] = prepareCurveData( t, v);

vMax = max(v);
vMin = min(v);


L = 0.0215;
C = 9.4700e-10;
R = str2double(name(2:end));

w0 = 1 / sqrt(L*C)
dumping = R / 2 * (sqrt(C/L));
s1 = -w0 * (dumping - sqrt(dumping^2 - 1)) ;
s2 = -w0 * (dumping + sqrt(dumping^2 - 1)) ;


amplitudeStartPoint = (vMax - vMin)
zeroStartPoint = vMin
dumpingStart = s1

% ft = fittype( 'A1*exp(s1*x)+A2*exp(s2*x) + c', 'independent', 'x', 'dependent', 'y' );
% opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
% opts.Display = 'Off';
% opts.Upper = [Inf, Inf, Inf, Inf, Inf];
% opts.Lower = [-Inf, -Inf, -Inf, -Inf, -Inf];
% opts.StartPoint = [amplitudeStartPoint, amplitudeStartPoint, s1, s2, zeroStartPoint];

ft = fittype( 'A*exp(b*x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Upper = [Inf, Inf, Inf];
opts.Lower = [-Inf, -Inf, -Inf];
opts.StartPoint = [amplitudeStartPoint, dumpingStart, zeroStartPoint];



[fit_, gof_] = fit( t, v, ft, opts );
    
end

