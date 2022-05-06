phi = [];
inputFrequency = [];
phiError = [];
fitFrequencyIn = [];
fitFrequencyOut = [];
fitFrequencyInError = [];
fitFrequencyInErrorLog = [];
AIn = [];
AOut = [];
VBerror = [];
AOuterror = [];

keys = fieldnames(fitsIn);
for i = 1:length(keys)
    key = keys{i};
    fitIn = fitsIn.(key);
    fitOut = fitsOut.(key);

    confintIn = confint(fitIn);
    confintOut = confint(fitOut);

    confintInLog = log(confintIn);
    confintOutLog = log(confintOut);

    inErrors_ = getErrorsFromFit(fitIn);
    outErrors_ = getErrorsFromFit(fitOut);


    fitFrequencyInErrorLog = [fitFrequencyInErrorLog, (confintInLog(2,2) - confintInLog(1,2)) / 4];
    fitFrequencyInError = [fitFrequencyInError, (confintIn(1,2) - confintIn(2,2)) / 4];
    phiError = [phiError, outErrors_(3)];
    AOuterror = [AOuterror, outErrors_(1)];


    phi = [phi, fitIn.c1 - fitOut.c1];
    phiLog = log(phi);

    VBerror = [VBerror, (confintOutLog(1,1) - confintOutLog(2,1)) / 4];
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

end

AErrorPlus = abs((AErrorPlus - A) / 2)
AErrorMinus = abs((AErrorMinus - A) / 2)
    
VB = 20* log10(AOut ./ AIn);




clear keys i key fit