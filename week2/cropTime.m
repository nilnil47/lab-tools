function [t,y] = cropTime(t,y, tMin, tMax, freq)
arguments
        t,
        y,
        tMin = NaN,
        tMax = NaN,
        freq = 20
end
%CROPTIME Summary of this function goes here
%   Detailed explanation goes here
t = t(tMin * freq + 1:tMax * freq + 1) - tMin
y = y(tMin * freq + 1:tMax * freq + 1)
end

