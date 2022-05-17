function name = filterKeyName(key)
%myFun - Description
%
% name Syntax: filterKeyName = key)
%
% Long description
k = key
    if startsWith(key, 'Times')
        name = sprintf('T%s',key(6:end))
    elseif startsWith(key, 'MagneticFieldStrengthAxialG')
        name = sprintf('V%s', key(28:end))
    elseif startsWith(key, 'MagneticFieldStrengthPerpendicularT')
        name = sprintf('H%s', key(36:end))
    else
        name = key
end