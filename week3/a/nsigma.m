function ret = nsigma(a,b,da,db)
%nsigma - Description
%
% Syntax: ret = nsigma(a,b,da,dret = abs(a-b) / sqrt(da^2+db^2);b)
%
% Long description
    ret = abs(a-b) / sqrt(da^2+db^2);
end