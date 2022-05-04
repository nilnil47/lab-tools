phi = [];
inputFrequency = [];
phiError = [];
fitFrequencyIn = [];
fitFrequencyOut = [];
AIn = [];
AOut = [];

keys = fieldnames(fitsIn);
for i = 1:length(keys)
    key = keys{i};
    fitIn = fitsIn.(key);
    fitOut = fitsOut.(key);

    deltaFitIn = confint(fitIn);
    deltaFitOut = confint(fitOut);

    phiInError_ = getErrorsFromFit(fitIn);
    phiOutError_ = getErrorsFromFit(fitOut);

    phiError = [phiError, phiOutError_ + phiInError_];

    phi = [phi, fitIn.c1 - fitOut.c1];
    phiLog = log(phi);

    inputFrequency = [inputFrequency ,str2num(key(2:end))];

    fitFrequencyIn = [fitFrequencyIn, fitIn.b1] ;
    fitFrequencyOut = [fitFrequencyOut, fitOut.b1]
    fitFrequencyInLog = log(fitFrequencyIn);
    
    AIn = [AIn, fitIn.a1] ;
    AOut = [AOut, fitOut.a1]

    A = AOut ./ AIn;
    ALog = log(A);

    AErrorPlus = deltaFitOut(2,1) / deltaFitIn(1,1)
    AErrorMinus = deltaFitOut(1,1) / deltaFitIn(2,1)

    AErrorPlus = abs((AErrorPlus - A) / 2)
    AErrorMinus = abs((AErrorMinus - A) / 2)
    
    VB = 20* log(AOut ./ AIn);
end



clear keys i key fit