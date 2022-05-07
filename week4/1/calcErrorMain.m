function errors = calcErrorMain(fit_)
%calcErrorMain fit_n
%
% Syntax: errors = calcErrorMain(fit_)
%
% Long description

confit_ = confint(fit_);
errors = abs((confit_(1,:) - confit_(2,:)) / 4);
    
end