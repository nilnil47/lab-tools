function var = createVariable(name, value)
%createVariable - Description
%
% Syntax: var = createVariable(input)
%
% Long description
    a = sprintf("%s = %s",name, value)
    eval(sprintf("%s = %s",name, value))
end