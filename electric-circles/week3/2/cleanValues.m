function [t,v] = cleanValues(t_,v_)
%myFun - Description
%
% Syntax: [t,v] = cleanValues(t_,v_)
%
% Long description
[val, index] = closest_value(t_, 0);
t = t_(index:end);
v = v_(index:end);    
end