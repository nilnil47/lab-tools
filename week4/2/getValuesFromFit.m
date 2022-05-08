phi = [];
inputFrequency = [];
phiError = [];
fitFrequencyIn = [];
fitFrequencyOut = [];
inputFrequencyErrorLog = [];
AIn = [];
AOut = [];

AErrorPlus = [];
AErrorMinus = [];

keys = fieldnames(fitsIn);
for i = 1:length(keys)
    key = keys{i};
    fitIn = fitsIn.(key);
    fitOut = fitsOut.(key);

    deltaFitIn = confint(fitIn);
    deltaFitOut = confint(fitOut);

    deltaLogFitIn = log(deltaFitIn)
    inputFrequencyErrorLog = [inputFrequencyErrorLog, abs(deltaLogFitIn(1,2) - deltaLogFitIn(2,2)) / 4]

    phiInError_ = getErrorsFromFit(fitIn);
    phiOutError_ = getErrorsFromFit(fitOut);

    phiError = [phiError, phiOutError_ + phiInError_];

    phi = [phi, fitIn.c1 - fitOut.c1];

    inputFrequency = [inputFrequency ,str2num(key(2:end))];

    fitFrequencyIn = [fitFrequencyIn, fitIn.b1] ;
    fitFrequencyOut = [fitFrequencyOut, fitOut.b1]
    
    AIn = [AIn, fitIn.a1] ;
    AOut = [AOut, fitOut.a1]

    A = AOut ./ AIn;

    AErrorPlus = [AErrorPlus, deltaFitOut(2,1) / deltaFitIn(1,1)]
    AErrorMinus = [AErrorMinus, deltaFitOut(1,1) / deltaFitIn(2,1)]

    
end

fitFrequencyInLog = log(fitFrequencyIn);
AErrorPlus = abs((AErrorPlus - A) / 2)
AErrorMinus = abs((AErrorMinus - A) / 2)

phiLog = log(phi);
ALog = log(A);
VB = 20* log(AOut ./ AIn);



clear i key fit