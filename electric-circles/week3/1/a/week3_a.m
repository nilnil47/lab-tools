% Fits = ["FitR1059"; "FitR10840"; "FitR2562"; "FitR5660"; "FitR6990"; "FitR8140"; "FitR9530"];
% T = [];
% for k=1:length(Fits)
%    T = [T, eval(strcat(Fits(k),'.b'))];
% end

Fits = ["FitR1059"; "FitR10840"; "FitR2562"; "FitR5660"; "FitR6990"; "FitR8140"; "FitR9530"];
Terror = [];
for k=1:length(Fits)
   Terror = [Terror, getErrorsFromFit(eval(Fits(k)))];
end
