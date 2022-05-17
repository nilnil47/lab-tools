function [errors] = getErrorsFromFit(fit_)
%GETERRORSFROMFIT Summary of this function goes here
%   Detailed explanation goes here
errors = confint(fit_);
errors = (errors(1,:) - errors(2,:)) / 4;


end

