function ret = fitResults(fittedmodel)
%fitResults - Description
%
% Syntax: ret = fitResultsfit_)
%
% Long description
errors = calcErrorMain(fittedmodel)
generateResults(fittedmodel, errors)


end