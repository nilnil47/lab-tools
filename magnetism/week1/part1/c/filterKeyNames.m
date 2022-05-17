function [name, type] = filterKeyName(key)
%myFun - Description
%
% name Syntax: filterKeyName = key)
%
% Long description
k = key
splited_ = split(key, '_')
index_ = splited_{end}
    if startsWith(key, 'Time_s_')
        name = sprintf('T%s',index_)
        type = 'T';
    elseif startsWith(key, 'MagneticFieldStrength_Axial__G_')
        name = sprintf('V%s', index_)
        type = 'V';
    elseif startsWith(key, 'MagneticFieldStrength_Perpendicular__T_')
        name = sprintf('H%s', index_)
        type = 'H';
    else
        name = NaN;
        type = NaN;
end