function result = genertateResults(fittedmodel, errors)
%genertateResults - Description
%
% Syntax: result = genertateResults(fit_)
%
% Long description
    names = coeffnames(fittedmodel);
    values = coeffvalues(fittedmodel);
    rounds = -floor(log10(errors))

    fileID = fopen('main/fitResults.txt','w');
    for i = 1:length(names)
        a = round(values(i), rounds(i))
        fprintf(fileID, '%s = %g ± %.1g\n', names{i}, round(values(i), rounds(i)), errors(i));
    end
    fclose(fileID);

end