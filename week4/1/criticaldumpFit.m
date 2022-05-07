function [fit_, gof_] = criticaldumpFit(t, v, name)
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
a = R / (2*L)


amplitudeStartPoint = (vMax - vMin) / 2
zeroStartPoint = vMin
dumpingStart = a

ft = fittype( 'A1*exp(b*x)+A2*x*exp(b*x)+c', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Upper = [Inf, Inf, Inf, Inf];
opts.Lower = [-Inf, -Inf, -Inf, -Inf];
opts.StartPoint = [amplitudeStartPoint, amplitudeStartPoint, dumpingStart, zeroStartPoint];


[fit_, gof_] = fit( t, v, ft, opts );
    
end

