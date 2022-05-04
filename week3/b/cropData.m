function [t,v] = cropData(t,v)
arguments
        t,
        v
end
%CROPTIME Summary of this function goes here
%   Detailed explanation goes here
m = max(v);
index =find(v==m);
t = t(index:end) - t(index);
v = v(index:end);
end

