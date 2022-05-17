function ret = insertCrop(tab, start, stop)
%insertCrop - Description
%
% Syntax: ret = insertCrop(key, start, stop)
%
% Long description
% narginchk(1,inf);

tab(stop:1:end, :) = [];
tab(1:1:start, :) = [];
tab.tIn = tab.tIn - tab.tIn(1);
tab.tOut = tab.tOut - tab.tOut(1);

plot(tab.tOut, tab.vOut)

ret = tab;
end