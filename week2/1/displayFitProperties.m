function result = displayFitProperties(fittedmodel)
%genertateResults - Description
%
% Syntax: result = genertateResults(fit_)
%
% Long description
result = sprintf("%s\n", formula(fittedmodel));
    names = coeffnames(fittedmodel);
    values = coeffvalues(fittedmodel);

    for i = 1:length(names)
        result = strcat(result, sprintf("%s = %f\n", names{i}, values(i)));
    end
    
end